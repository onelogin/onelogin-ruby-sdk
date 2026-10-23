require "spec_helper"

RSpec.describe Cursor do
  let(:users_url) { "https://api.us.onelogin.com/api/1/users" }
  let(:json_headers) { { 'Content-Type' => 'application/json' } }

  let(:client) do
    OneLogin::Api::Client.new(client_id: 'test_id', client_secret: 'test_secret')
  end

  # Seed a live token so the cursor doesn't try to fetch one.
  before do
    client.instance_variable_set(:@access_token, 'test_token')
    client.instance_variable_set(:@refresh_token, 'test_refresh')
    client.instance_variable_set(:@expiration, Time.now.utc + 3600)
  end

  def stub_users(status:, body:, headers: json_headers)
    stub_request(:get, users_url).to_return(status: status, body: body, headers: headers)
  end

  def error_body(code, type, message)
    { status: { error: true, code: code, type: type, message: message } }.to_json
  end

  describe 'error responses from a paginated endpoint' do
    it 'raises ApiException on a 401' do
      stub_users(status: 401, body: error_body(401, 'Unauthorized', 'Authentication Failure'))

      expect { client.get_users.to_a }
        .to raise_error(OneLogin::Api::ApiException) { |e| expect(e.code).to eq(401) }
    end

    it 'raises ApiException on a 400' do
      stub_users(status: 400, body: error_body(400, 'bad request', 'Invalid parameter'))

      expect { client.get_users.to_a }
        .to raise_error(OneLogin::Api::ApiException) { |e| expect(e.code).to eq(400) }
    end

    it 'raises ApiException on an empty body' do
      stub_users(status: 401, body: '')

      expect { client.get_users.to_a }.to raise_error(OneLogin::Api::ApiException)
    end

    # HTTParty parses by Content-Type, so a proxy/load-balancer error page comes
    # back as a String. Before this guard that raised NoMethodError on has_key?.
    it 'raises ApiException on a non-JSON error page' do
      stub_users(status: 502, body: '<html>502 Bad Gateway</html>',
                 headers: { 'Content-Type' => 'text/html' })

      expect { client.get_users.to_a }
        .to raise_error(OneLogin::Api::ApiException) { |e| expect(e.code).to eq(502) }
    end

    it 'reports the real HTTP status rather than a fabricated 500' do
      stub_users(status: 503, body: 'upstream unavailable',
                 headers: { 'Content-Type' => 'text/plain' })

      expect { client.get_users.to_a }
        .to raise_error(OneLogin::Api::ApiException) { |e| expect(e.code).to eq(503) }
    end
  end

  describe 'successful responses' do
    it 'still yields models on a 200' do
      stub_users(status: 200, body: { status: { error: false, code: 200 },
                                      data: [{ id: 1, username: 'alice' },
                                             { id: 2, username: 'bob' }] }.to_json)

      users = client.get_users.to_a

      expect(users.size).to eq(2)
      expect(users.map(&:username)).to eq(%w[alice bob])
    end
  end

  # v2 returns a bare array and pages with an After-Cursor header. Verified on
  # a live tenant: the cursor carries the filters and page size, and roles
  # rejects a cursor sent with limit ("cursor xor pagination arguments").
  describe 'v2 paging' do
    let(:v2_url) { "https://api.us.onelogin.com/api/2/users" }

    let(:v2_client) do
      OneLogin::Api::Client.new(client_id: 'test_id', client_secret: 'test_secret', api_version: 2).tap do |c|
        c.instance_variable_set(:@access_token, 'test_token')
        c.instance_variable_set(:@expiration, Time.now.utc + 3600)
      end
    end

    def page(*names, after_cursor: nil)
      headers = json_headers
      headers = headers.merge('After-Cursor' => after_cursor) if after_cursor
      { status: 200, body: names.map { |name| { id: name.hash, username: name } }.to_json, headers: headers }
    end

    it 'follows After-Cursor, sending the cursor alone' do
      first = stub_request(:get, v2_url).with(query: { 'limit' => '2', 'email' => '*example.com' })
                                        .to_return(page('alice', 'bob', after_cursor: 'c2'))
      second = stub_request(:get, v2_url).with(query: { 'cursor' => 'c2' })
                                         .to_return(page('carol'))

      users = v2_client.get_users(limit: 2, email: '*example.com').to_a

      expect(users.map(&:username)).to eq(%w[alice bob carol])
      expect(first).to have_been_made.once
      expect(second).to have_been_made.once
    end

    it 'stops at max_results without fetching another page' do
      stub_request(:get, v2_url).with(query: { 'limit' => '2' })
                                .to_return(page('alice', 'bob', after_cursor: 'c2'))
      next_page = stub_request(:get, v2_url).with(query: { 'cursor' => 'c2' })

      users = v2_client.get_users(limit: 2).take(2)

      expect(users.map(&:username)).to eq(%w[alice bob])
      expect(next_page).not_to have_been_made
    end

    it 'raises ApiException on a v2 error' do
      stub_request(:get, v2_url).to_return(
        status: 400, headers: json_headers,
        body: { status: 400, error: 'BadRequestError',
                description: 'Requests can only have cursor xor pagination arguments' }.to_json
      )

      expect { v2_client.get_users.to_a }.to raise_error(OneLogin::Api::ApiException) { |e|
        expect(e.code).to eq(400)
        expect(e.message).to eq('Requests can only have cursor xor pagination arguments')
      }
    end

    it 'raises ApiException on a non-JSON error page' do
      stub_request(:get, v2_url).to_return(status: 502, body: '<html>502 Bad Gateway</html>',
                                           headers: { 'Content-Type' => 'text/html' })

      expect { v2_client.get_users.to_a }
        .to raise_error(OneLogin::Api::ApiException) { |e| expect(e.code).to eq(502) }
    end
  end
end
