require "spec_helper"

RSpec.describe "Token Expiration Handling" do
  let(:client_id) { 'test_client_id' }
  let(:client_secret) { 'test_client_secret' }
  let(:region) { 'us' }
  let(:token_url) { 'https://api.us.onelogin.com/auth/oauth2/v2/token' }

  # Anchored to "now" so the fixtures always describe a token that is currently
  # live. A hard-coded date would silently start yielding already-expired
  # tokens and mask regressions in `expired?`.
  let(:issued_at) { Time.now.utc }

  def token_payload(access_token, refresh_token)
    {
      access_token: access_token,
      refresh_token: refresh_token,
      token_type: 'bearer',
      expires_in: 36000,
      created_at: issued_at.iso8601
    }.to_json
  end

  let(:new_token_response) { token_payload('new_access_token', 'new_refresh_token') }
  let(:refreshed_token_response) { token_payload('refreshed_access_token', 'refreshed_refresh_token') }

  let(:client) do
    OneLogin::Api::Client.new(
      client_id: client_id,
      client_secret: client_secret,
      region: region
    )
  end

  # The client exposes no reader for the stored token, so assertions have to
  # reach for the ivar.
  def stored_access_token
    client.instance_variable_get(:@access_token)
  end

  def seed_token(expires_in:, access_token: 'old_token', refresh_token: 'old_refresh')
    client.instance_variable_set(:@access_token, access_token)
    client.instance_variable_set(:@refresh_token, refresh_token)
    client.instance_variable_set(:@expiration, Time.now.utc + expires_in)
  end

  def stub_client_credentials(status: 200, body: nil)
    stub_request(:post, token_url)
      .with(
        body: { 'grant_type' => 'client_credentials' }.to_json,
        headers: {
          'Authorization' => "client_id:#{client_id},client_secret:#{client_secret}",
          'Content-Type' => 'application/json'
        }
      )
      .to_return(status: status, body: body || new_token_response)
  end

  def stub_refresh(status: 200, body: nil, access_token: 'old_token', refresh_token: 'old_refresh')
    stub_request(:post, token_url)
      .with(
        body: {
          'grant_type' => 'refresh_token',
          'access_token' => access_token,
          'refresh_token' => refresh_token
        }.to_json
      )
      .to_return(status: status, body: body || refreshed_token_response)
  end

  describe '#expired?' do
    it 'is true when no token has been fetched yet' do
      expect(client.expired?).to be true
    end

    it 'is true when an expiration was never recorded' do
      client.instance_variable_set(:@access_token, 'test_token')
      client.instance_variable_set(:@expiration, nil)

      expect(client.expired?).to be true
    end

    it 'is true inside the refresh buffer' do
      seed_token(expires_in: 25)

      expect(client.expired?).to be true
    end

    it 'is false outside the refresh buffer' do
      seed_token(expires_in: 60)

      expect(client.expired?).to be false
    end
  end

  describe '#prepare_token' do
    it 'fetches a new token when none is held' do
      request = stub_client_credentials

      client.prepare_token

      expect(request).to have_been_made
      expect(stored_access_token).to eq('new_access_token')
    end

    it 'does not touch the network while the token is still valid' do
      seed_token(expires_in: 3600)

      client.prepare_token

      expect(a_request(:post, token_url)).not_to have_been_made
      expect(stored_access_token).to eq('old_token')
    end

    it 'refreshes the token once it is inside the buffer' do
      seed_token(expires_in: 25)
      refresh = stub_refresh

      client.prepare_token

      expect(refresh).to have_been_made
      expect(stored_access_token).to eq('refreshed_access_token')
    end

    it 'falls back to client_credentials when the refresh grant fails' do
      seed_token(expires_in: 25)
      refresh = stub_refresh(status: 401, body: { error: 'invalid_token' }.to_json)
      fallback = stub_client_credentials

      client.prepare_token

      expect(refresh).to have_been_made
      expect(fallback).to have_been_made
      expect(stored_access_token).to eq('new_access_token')
    end

    it 'leaves the stale token and records the error when both grants fail' do
      seed_token(expires_in: 25)
      stub_refresh(status: 401, body: { error: 'invalid_token' }.to_json)
      stub_client_credentials(status: 401, body: { error: 'invalid_client' }.to_json)

      client.prepare_token

      expect(stored_access_token).to eq('old_token')
      expect(client.error).to eq('401')
    end
  end

  describe 'token_expiration_buffer' do
    it 'defaults to 30 seconds' do
      expect(client.instance_variable_get(:@token_expiration_buffer)).to eq(30)
    end

    it 'honours a custom buffer' do
      client = OneLogin::Api::Client.new(
        client_id: client_id,
        client_secret: client_secret,
        token_expiration_buffer: 60
      )
      client.instance_variable_set(:@expiration, Time.now.utc + 45)

      expect(client.expired?).to be true
    end

    # `options[:x] || DEFAULT` would clobber a caller-supplied 0 in most
    # languages; in Ruby 0 is truthy, so opting out of the buffer works.
    it 'allows disabling the buffer with 0' do
      client = OneLogin::Api::Client.new(
        client_id: client_id,
        client_secret: client_secret,
        token_expiration_buffer: 0
      )
      client.instance_variable_set(:@expiration, Time.now.utc + 5)

      expect(client.instance_variable_get(:@token_expiration_buffer)).to eq(0)
      expect(client.expired?).to be false
    end
  end
end
