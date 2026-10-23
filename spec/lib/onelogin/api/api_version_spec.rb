require "spec_helper"

# Issue #117. Bodies follow what the v1 and v2 endpoints returned on a live
# tenant, trimmed to the fields under test.
RSpec.describe "API version selection" do
  let(:json_headers) { { 'Content-Type' => 'application/json' } }
  let(:base) { 'https://api.us.onelogin.com' }

  def client_for(**options)
    OneLogin::Api::Client.new(client_id: 'test_id', client_secret: 'test_secret', **options).tap do |client|
      client.instance_variable_set(:@access_token, 'test_token')
      client.instance_variable_set(:@refresh_token, 'test_refresh')
      client.instance_variable_set(:@expiration, Time.now.utc + 3600)
    end
  end

  def v1_body(data)
    { status: { error: false, code: 200, type: 'success', message: 'Success' }, data: data }.to_json
  end

  def stub_json(method, path, status: 200, body: '', headers: {})
    stub_request(method, "#{base}#{path}")
      .to_return(status: status, body: body, headers: json_headers.merge(headers))
  end

  let(:user) { { 'id' => 7, 'username' => 'alice', 'email' => 'alice@example.com' } }
  let(:v1_client) { client_for }
  let(:v2_client) { client_for(api_version: 2) }

  describe 'the api_version option' do
    it 'is unset by default' do
      expect(client_for.api_version).to be_nil
    end

    it 'accepts the supported versions' do
      expect(client_for(api_version: 1).api_version).to eq(1)
      expect(client_for(api_version: 2).api_version).to eq(2)
    end

    # ENV-backed configs hand every value over as a String.
    it 'accepts a numeric String' do
      expect(client_for(api_version: '2').api_version).to eq(2)
    end

    it 'rejects an unsupported version' do
      expect { client_for(api_version: 3) }.to raise_error(ArgumentError, /must be one of 1, 2, got 3/)
    end

    it 'rejects a non-numeric version' do
      expect { client_for(api_version: 'v2') }.to raise_error(ArgumentError, /got "v2"/)
    end
  end

  describe 'API_VERSIONS' do
    it 'is reachable from the client' do
      expect(OneLogin::Api::Client::API_VERSIONS).to equal(OneLogin::Api::Util::Constants::API_VERSIONS)
    end

    it 'only names public client methods' do
      OneLogin::Api::Util::Constants::API_VERSIONS.each_key do |method|
        expect(OneLogin::Api::Client.public_method_defined?(method)).to be(true), "#{method} is not a client method"
      end
    end

    it 'is frozen' do
      expect(OneLogin::Api::Util::Constants::API_VERSIONS).to be_frozen
      expect(OneLogin::Api::Util::Constants::API_VERSIONS.values).to all(be_frozen)
    end
  end

  describe 'methods without v2 support' do
    it 'keep their default version when api_version is 2' do
      request = stub_json(:get, '/api/1/groups', body: v1_body([]))

      v2_client.get_groups.to_a

      expect(request).to have_been_made
    end

    it 'keep their default version when api_version is 1' do
      request = stub_json(:get, '/api/2/apps', body: [].to_json)

      client_for(api_version: 1).get_apps

      expect(request).to have_been_made
    end

    it 'keep their default version when listed without the configured one' do
      stub_const('OneLogin::Api::Util::Constants::API_VERSIONS',
                 OneLogin::Api::Util::Constants::API_VERSIONS.merge(get_role: [2]))
      stub_json(:get, '/api/2/roles/3', body: { id: 3, name: 'Default' }.to_json)

      expect(client_for(api_version: 1).get_role(3).name).to eq('Default')
    end
  end

  describe '#get_users' do
    it 'calls v1 by default' do
      stub_json(:get, '/api/1/users', body: v1_body([user]))

      expect(v1_client.get_users.map(&:username)).to eq(['alice'])
    end

    it 'calls v1 when api_version is 1' do
      stub_json(:get, '/api/1/users', body: v1_body([user]))

      expect(client_for(api_version: 1).get_users.map(&:username)).to eq(['alice'])
    end

    it 'calls v2 and reads the bare array' do
      stub_json(:get, '/api/2/users', body: [user].to_json)

      expect(v2_client.get_users.map(&:username)).to eq(['alice'])
    end

    it 'forwards filters on the first v2 request' do
      request = stub_request(:get, "#{base}/api/2/users")
        .with(query: { 'email' => 'alice@example.com' })
        .to_return(status: 200, body: [user].to_json, headers: json_headers)

      v2_client.get_users(email: 'alice@example.com').to_a

      expect(request).to have_been_made
    end
  end

  describe '#get_user' do
    it 'calls v1 by default' do
      stub_json(:get, '/api/1/users/7', body: v1_body([user.merge('role_id' => [3])]))

      result = v1_client.get_user(7)

      expect(result.username).to eq('alice')
      expect(result.role_ids).to eq([3])
    end

    it 'calls v2 and reads the bare user' do
      stub_json(:get, '/api/2/users/7', body: user.merge('role_ids' => [3]).to_json)

      result = v2_client.get_user(7)

      expect(result.username).to eq('alice')
      expect(result.role_ids).to eq([3])
    end

    it 'reports a v2 error' do
      stub_json(:get, '/api/2/users/7', status: 404,
                body: { name: 'NotFoundError', message: 'The resource with the given id could not be found',
                        statusCode: 404 }.to_json)

      expect(v2_client.get_user(7)).to be_nil
      expect(v2_client.error).to eq('404')
      expect(v2_client.error_description).to eq('The resource with the given id could not be found')
    end
  end

  describe '#get_user_apps' do
    let(:v1_app) do
      { 'id' => 5, 'name' => 'Wiki', 'icon' => 'https://example.com/i.png', 'provisioned' => 'unknown',
        'extension' => false, 'login_id' => 'alice@example.com', 'personal' => false }
    end

    let(:v2_app) do
      { 'id' => 5, 'name' => 'Wiki', 'icon_url' => 'https://example.com/i.png', 'provisioning_enabled' => false,
        'provisioning_state' => 'unknown', 'provisioning_status' => 'enabled', 'extension' => false,
        'login_id' => 2148485823 }
    end

    it 'calls v1 by default' do
      stub_json(:get, '/api/1/users/7/apps', body: v1_body([v1_app]))

      app = v1_client.get_user_apps(7).first

      expect(app.icon).to eq('https://example.com/i.png')
      expect(app.login_id).to eq('alice@example.com')
      expect(app.provisioned).to eq('unknown')
    end

    it 'calls v2 and maps its field names' do
      stub_json(:get, '/api/2/users/7/apps', body: [v2_app].to_json)

      app = v2_client.get_user_apps(7).first

      expect(app.icon).to eq('https://example.com/i.png')
      expect(app.login_id).to eq(2148485823)
      expect(app.provisioning_state).to eq('unknown')
      expect(app.provisioning_status).to eq('enabled')
      expect(app.provisioning_enabled).to be(false)
    end
  end

  describe '#create_user' do
    let(:params) { { 'email' => 'alice@example.com', 'username' => 'alice' } }

    it 'calls v1 by default' do
      stub_json(:post, '/api/1/users', body: v1_body([user]))

      expect(v1_client.create_user(params).id).to eq(7)
    end

    it 'calls v2 and accepts its 201' do
      stub_json(:post, '/api/2/users', status: 201, body: user.to_json)

      expect(v2_client.create_user(params).id).to eq(7)
    end

    it 'reports a v2 validation error' do
      stub_json(:post, '/api/2/users', status: 422,
                body: { name: 'UnprocessableEntityError',
                        message: 'Validation failed: Need at least an email or username',
                        statusCode: 422 }.to_json)

      expect(v2_client.create_user({})).to be_nil
      expect(v2_client.error).to eq('422')
      expect(v2_client.error_description).to eq('Validation failed: Need at least an email or username')
    end
  end

  describe '#update_user' do
    it 'calls v1 by default' do
      stub_json(:put, '/api/1/users/7', body: v1_body([user.merge('title' => 'Dev')]))

      expect(v1_client.update_user(7, title: 'Dev').title).to eq('Dev')
    end

    it 'calls v2 and reads the bare user' do
      stub_json(:put, '/api/2/users/7', body: user.merge('title' => 'Dev').to_json)

      expect(v2_client.update_user(7, title: 'Dev').title).to eq('Dev')
    end
  end

  describe '#delete_user' do
    it 'calls v1 by default' do
      stub_json(:delete, '/api/1/users/7',
                body: { status: { error: false, code: 200, type: 'success', message: 'Success' } }.to_json)

      expect(v1_client.delete_user(7)).to be(true)
    end

    it 'calls v2 and accepts its empty 204' do
      stub_json(:delete, '/api/2/users/7', status: 204)

      expect(v2_client.delete_user(7)).to be(true)
    end

    it 'reports a v2 error' do
      stub_json(:delete, '/api/2/users/7', status: 404,
                body: { name: 'NotFoundError', message: 'The resource with the given id could not be found',
                        statusCode: 404 }.to_json)

      expect(v2_client.delete_user(7)).to be(false)
      expect(v2_client.error).to eq('404')
    end
  end

  describe '#get_roles' do
    it 'calls v1 by default' do
      stub_json(:get, '/api/1/roles', body: v1_body([{ id: 3, name: 'Default' }]))

      expect(v1_client.get_roles.map(&:name)).to eq(['Default'])
    end

    it 'calls v2 and reads the bare array' do
      stub_json(:get, '/api/2/roles', body: [{ id: 3, name: 'Default', admins: [], apps: [], users: [7] }].to_json)

      expect(v2_client.get_roles.map(&:name)).to eq(['Default'])
    end
  end

  describe '#get_role' do
    it 'calls v1 by default' do
      stub_json(:get, '/api/1/roles/3', body: v1_body([{ id: 3, name: 'Default' }]))

      expect(v1_client.get_role(3).name).to eq('Default')
    end

    it 'calls v2 and reads the bare role' do
      stub_json(:get, '/api/2/roles/3', body: { id: 3, name: 'Default', admins: [], apps: [], users: [7] }.to_json)

      expect(v2_client.get_role(3).name).to eq('Default')
    end

    # v2 roles send status as the bare HTTP code, which the v1 parser used to
    # call has_key? on.
    it 'reports a v2 error' do
      stub_json(:get, '/api/2/roles/3', status: 404,
                body: { status: 404, error: 'NotFoundError', description: 'Resource not found' }.to_json)

      expect(v2_client.get_role(3)).to be_nil
      expect(v2_client.error).to eq('404')
      expect(v2_client.error_description).to eq('Resource not found')
    end
  end
end
