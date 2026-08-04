require "spec_helper"

RSpec.describe "Caller-supplied parameter hashes" do
  let(:client) do
    OneLogin::Api::Client.new(client_id: 'test_id', client_secret: 'test_secret')
  end

  before do
    client.instance_variable_set(:@access_token, 'test_token')
    client.instance_variable_set(:@refresh_token, 'test_refresh')
    client.instance_variable_set(:@expiration, Time.now.utc + 3600)
  end

  describe '#create_session_login_token' do
    let(:url) { 'https://api.us.onelogin.com/api/1/login/auth' }
    let(:success_body) do
      { status: { error: false, code: 200, type: 'success', message: 'Success' },
        data: [{ status: 'Authenticated', user: { id: 1, username: 'alice' },
                 session_token: 'tok', return_to_url: nil, expires_at: '2026-01-01T00:00:00Z' }] }.to_json
    end

    # Issue #59: the README and examples use symbol keys, but the required
    # parameter check looked them up as strings and rejected them.
    it 'accepts symbol keys' do
      request = stub_request(:post, url)
        .to_return(status: 200, body: success_body, headers: { 'Content-Type' => 'application/json' })

      client.create_session_login_token(
        username_or_email: 'user@example.com',
        password: 'secret',
        subdomain: 'example'
      )

      expect(request).to have_been_made
      expect(client.error).to be_nil
    end

    it 'still accepts string keys' do
      request = stub_request(:post, url)
        .to_return(status: 200, body: success_body, headers: { 'Content-Type' => 'application/json' })

      client.create_session_login_token(
        'username_or_email' => 'user@example.com',
        'password' => 'secret',
        'subdomain' => 'example'
      )

      expect(request).to have_been_made
      expect(client.error).to be_nil
    end

    # A string-keyed hash is passed through untouched, so callers using a Hash
    # subclass with its own to_json keep the object they handed us.
    it 'leaves an already-string-keyed hash untouched' do
      params = { 'username_or_email' => 'u', 'password' => 'p', 'subdomain' => 's' }
      seen = nil

      stub_request(:post, url).to_return do |req|
        seen = req.body
        { status: 200, body: success_body, headers: { 'Content-Type' => 'application/json' } }
      end

      expect(client.send(:stringify_param_keys, params)).to equal(params)

      client.create_session_login_token(params)
      expect(seen).to eq(params.to_json)
    end

    it 'serializes symbol and string keys to the same body' do
      bodies = []
      stub_request(:post, url).to_return do |req|
        bodies << req.body
        { status: 200, body: success_body, headers: { 'Content-Type' => 'application/json' } }
      end

      client.create_session_login_token(username_or_email: 'u', password: 'p', subdomain: 's')
      client.create_session_login_token('username_or_email' => 'u', 'password' => 'p', 'subdomain' => 's')

      expect(bodies.uniq.size).to eq(1)
    end

    it 'still rejects a genuinely incomplete hash' do
      expect { client.create_session_login_token(username_or_email: 'u') }
        .not_to raise_error

      expect(client.error).to eq('500')
      expect(client.error_description).to match(/required parameters/)
    end
  end

  describe '#create_app' do
    let(:url) { 'https://api.us.onelogin.com/api/2/apps' }

    # The guard read `unless has_key? || value.empty?`, which is true in every
    # case, so it never fired.
    it 'rejects a missing connector_id' do
      client.create_app({})

      expect(client.error).to eq('400')
      expect(client.error_attribute).to eq('connector_id')
    end

    it 'rejects an empty connector_id' do
      client.create_app('connector_id' => '')

      expect(client.error).to eq('400')
      expect(client.error_attribute).to eq('connector_id')
    end

    it 'rejects nil with the connector_id error rather than a generic 500' do
      client.create_app(nil)

      expect(client.error).to eq('400')
      expect(client.error_attribute).to eq('connector_id')
    end

    it 'rejects a non-Hash argument the same way' do
      client.create_app('connector_id=123')

      expect(client.error).to eq('400')
      expect(client.error_attribute).to eq('connector_id')
    end

    it 'accepts a symbol-keyed connector_id' do
      request = stub_request(:post, url)
        .to_return(status: 201, body: { id: 1, name: 'app', connector_id: 123 }.to_json,
                   headers: { 'Content-Type' => 'application/json' })

      client.create_app(connector_id: 123, name: 'app')

      expect(request).to have_been_made
      expect(client.error).to be_nil
    end
  end
end
