require "spec_helper"
require "webmock/rspec"

RSpec.describe "Token Expiration Handling" do
  let(:client_id) { 'test_client_id' }
  let(:client_secret) { 'test_client_secret' }
  let(:region) { 'us' }
  let(:token_url) { 'https://api.us.onelogin.com/auth/oauth2/v2/token' }
  
  let(:test_time) { Time.utc(2025, 1, 1, 12, 0, 0) }
  
  let(:valid_token_response) {
    {
      access_token: 'test_access_token',
      refresh_token: 'test_refresh_token',
      token_type: 'bearer',
      expires_in: 36000,
      created_at: test_time.iso8601
    }.to_json
  }

  let(:refreshed_token_response) {
    {
      access_token: 'refreshed_access_token',
      refresh_token: 'refreshed_refresh_token',
      token_type: 'bearer',
      expires_in: 36000,
      created_at: test_time.iso8601
    }.to_json
  }

  before(:each) do
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  after(:each) do
    WebMock.reset!
  end

  context 'when token is nil' do
    it 'expired? should return true' do
      client = OneLogin::Api::Client.new(
        client_id: client_id,
        client_secret: client_secret,
        region: region
      )
      
      expect(client.send(:expired?)).to be true
    end

    it 'prepare_token should get a new token' do
      client = OneLogin::Api::Client.new(
        client_id: client_id,
        client_secret: client_secret,
        region: region
      )

      stub_request(:post, token_url)
        .with(
          body: { 'grant_type' => 'client_credentials' }.to_json,
          headers: {
            'Authorization' => "client_id:#{client_id},client_secret:#{client_secret}",
            'Content-Type' => 'application/json'
          }
        )
        .to_return(status: 200, body: valid_token_response, headers: {})

      client.send(:prepare_token)
      
      expect(client.instance_variable_get(:@access_token)).to eq('test_access_token')
    end
  end

  context 'when token is about to expire' do
    it 'expired? should return true when within expiration buffer' do
      client = OneLogin::Api::Client.new(
        client_id: client_id,
        client_secret: client_secret,
        region: region,
        token_expiration_buffer: 30
      )

      # Set token to expire in 25 seconds (less than 30 second buffer)
      client.instance_variable_set(:@access_token, 'test_token')
      client.instance_variable_set(:@refresh_token, 'test_refresh')
      client.instance_variable_set(:@expiration, Time.now.utc + 25)

      expect(client.send(:expired?)).to be true
    end

    it 'expired? should return false when outside expiration buffer' do
      client = OneLogin::Api::Client.new(
        client_id: client_id,
        client_secret: client_secret,
        region: region,
        token_expiration_buffer: 30
      )

      # Set token to expire in 60 seconds (more than 30 second buffer)
      client.instance_variable_set(:@access_token, 'test_token')
      client.instance_variable_set(:@refresh_token, 'test_refresh')
      client.instance_variable_set(:@expiration, Time.now.utc + 60)

      expect(client.send(:expired?)).to be false
    end

    it 'prepare_token should regenerate token when expired' do
      client = OneLogin::Api::Client.new(
        client_id: client_id,
        client_secret: client_secret,
        region: region,
        token_expiration_buffer: 30
      )

      # Set token to expire in 25 seconds
      client.instance_variable_set(:@access_token, 'old_token')
      client.instance_variable_set(:@refresh_token, 'old_refresh')
      client.instance_variable_set(:@expiration, Time.now.utc + 25)

      stub_request(:post, token_url)
        .with(
          body: {
            'grant_type' => 'refresh_token',
            'access_token' => 'old_token',
            'refresh_token' => 'old_refresh'
          }.to_json,
          headers: {
            'Content-Type' => 'application/json'
          }
        )
        .to_return(status: 200, body: refreshed_token_response, headers: {})

      client.send(:prepare_token)
      
      expect(client.instance_variable_get(:@access_token)).to eq('refreshed_access_token')
    end
  end

  context 'when token regeneration fails' do
    it 'should fall back to getting a new token' do
      client = OneLogin::Api::Client.new(
        client_id: client_id,
        client_secret: client_secret,
        region: region,
        token_expiration_buffer: 30
      )

      # Set token to be expired
      client.instance_variable_set(:@access_token, 'old_token')
      client.instance_variable_set(:@refresh_token, 'old_refresh')
      client.instance_variable_set(:@expiration, Time.now.utc + 25)

      # First request: regenerate_token fails with 401
      stub_request(:post, token_url)
        .with(
          body: {
            'grant_type' => 'refresh_token',
            'access_token' => 'old_token',
            'refresh_token' => 'old_refresh'
          }.to_json
        )
        .to_return(status: 401, body: { error: 'invalid_token' }.to_json, headers: {})

      # Second request: get new token succeeds
      stub_request(:post, token_url)
        .with(
          body: { 'grant_type' => 'client_credentials' }.to_json,
          headers: {
            'Authorization' => "client_id:#{client_id},client_secret:#{client_secret}",
            'Content-Type' => 'application/json'
          }
        )
        .to_return(status: 200, body: valid_token_response, headers: {})

      client.send(:prepare_token)
      
      # Should have new token, not the old one
      expect(client.instance_variable_get(:@access_token)).to eq('test_access_token')
    end
  end

  context 'configurable token expiration buffer' do
    it 'allows custom expiration buffer' do
      client = OneLogin::Api::Client.new(
        client_id: client_id,
        client_secret: client_secret,
        region: region,
        token_expiration_buffer: 60
      )

      # Set token to expire in 45 seconds (less than 60 second buffer)
      client.instance_variable_set(:@access_token, 'test_token')
      client.instance_variable_set(:@refresh_token, 'test_refresh')
      client.instance_variable_set(:@expiration, Time.now.utc + 45)

      expect(client.send(:expired?)).to be true
    end

    it 'uses default buffer of 30 seconds if not specified' do
      client = OneLogin::Api::Client.new(
        client_id: client_id,
        client_secret: client_secret,
        region: region
      )

      expect(client.instance_variable_get(:@token_expiration_buffer)).to eq(30)
    end
  end
end
