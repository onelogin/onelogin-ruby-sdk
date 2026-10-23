require "spec_helper"

RSpec.describe OneLogin::Api::Util::UrlBuilder do
  urls = OneLogin::Api::Util::Constants

  let(:client) do
    OneLogin::Api::Client.new(client_id: 'test_id', client_secret: 'test_secret')
  end

  let(:eu_client) do
    OneLogin::Api::Client.new(client_id: 'test_id', client_secret: 'test_secret', region: 'eu')
  end

  describe 'without a version' do
    it 'fills in the region' do
      expect(client.url_for(urls::GET_USERS_URL)).to eq('https://api.us.onelogin.com/api/1/users')
      expect(eu_client.url_for(urls::GET_USERS_URL)).to eq('https://api.eu.onelogin.com/api/1/users')
    end

    it 'fills in one id' do
      expect(client.url_for(urls::GET_USER_URL, 42)).to eq('https://api.us.onelogin.com/api/1/users/42')
    end

    it 'fills in two ids' do
      expect(client.url_for(urls::DELETE_APP_PARAMETER_URL, 7, 9))
        .to eq('https://api.us.onelogin.com/api/2/apps/7/parameters/9')
    end

    it 'builds unversioned endpoints' do
      expect(client.url_for(urls::TOKEN_REQUEST_URL)).to eq('https://api.us.onelogin.com/auth/oauth2/v2/token')
    end
  end

  describe 'with a version' do
    it 'swaps the version segment' do
      expect(client.url_for(urls::GET_USERS_URL, version: 2)).to eq('https://api.us.onelogin.com/api/2/users')
      expect(client.url_for(urls::GET_APPS_URL, version: 1)).to eq('https://api.us.onelogin.com/api/1/apps')
    end

    it 'keeps the region and ids' do
      expect(eu_client.url_for(urls::GET_USER_URL, 42, version: 2))
        .to eq('https://api.eu.onelogin.com/api/2/users/42')
      expect(client.url_for(urls::REMOVE_FACTOR_URL, 1, 2, version: 2))
        .to eq('https://api.us.onelogin.com/api/2/users/1/otp_devices/2')
    end

    it 'leaves the constant untouched' do
      client.url_for(urls::GET_USERS_URL, version: 2)

      expect(urls::GET_USERS_URL).to eq('https://api.%s.onelogin.com/api/1/users')
    end

    it 'raises on an endpoint without a version segment' do
      expect { client.url_for(urls::TOKEN_REQUEST_URL, version: 2) }
        .to raise_error(ArgumentError, /no single API version segment/)
    end
  end

  # Swapping only works if every versioned endpoint has exactly one segment.
  urls.constants.sort.each do |name|
    value = urls.const_get(name)
    next unless value.is_a?(String) && value.include?('/api/')

    it "finds exactly one version segment in #{name}" do
      expect(value.scan(described_class::API_VERSION_SEGMENT).size).to eq(1)
    end
  end
end
