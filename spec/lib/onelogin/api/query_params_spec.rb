require "spec_helper"

RSpec.describe "Query parameter forwarding" do
  let(:users_url) { "https://api.us.onelogin.com/api/1/users" }

  let(:client) do
    OneLogin::Api::Client.new(client_id: 'test_id', client_secret: 'test_secret')
  end

  before do
    client.instance_variable_set(:@access_token, 'test_token')
    client.instance_variable_set(:@expiration, Time.now.utc + 3600)
  end

  def stub_users(query)
    stub_request(:get, users_url)
      .with(query: hash_including(query))
      .to_return(status: 200,
                 body: { status: { error: false, code: 200 }, data: [] }.to_json,
                 headers: { 'Content-Type' => 'application/json' })
  end

  # Issue #18 asked for server-side sorting, assuming it was unsupported. It
  # works today - params are forwarded straight to the API query string - it
  # just wasn't documented anywhere.
  it 'forwards sort to the API' do
    request = stub_users('sort' => '+id')

    client.get_users(sort: '+id').to_a

    expect(request).to have_been_made
  end

  it 'forwards a descending sort' do
    request = stub_users('sort' => '-last_login')

    client.get_users(sort: '-last_login').to_a

    expect(request).to have_been_made
  end

  it 'forwards sort alongside other parameters' do
    request = stub_users('sort' => '+last_login', 'limit' => '10')

    client.get_users(sort: '+last_login', limit: 10).to_a

    expect(request).to have_been_made
  end

  it 'forwards filter parameters' do
    request = stub_users('email' => 'user@example.com')

    client.get_users(email: 'user@example.com').to_a

    expect(request).to have_been_made
  end

  it 'forwards fields' do
    request = stub_users('fields' => 'email,firstname')

    client.get_users(fields: 'email,firstname').to_a

    expect(request).to have_been_made
  end

  # `limit` is the API's page size, not a cap on the total. The cursor keeps
  # following after_cursor until the pages run out or max_results is hit, so
  # the README has to use `take` when it means "give me exactly N".
  describe 'limit is page size, not a total cap' do
    def page(ids, after_cursor)
      { status: { error: false, code: 200 },
        data: ids.map { |id| { id: id, username: "u#{id}" } },
        pagination: { after_cursor: after_cursor } }.to_json
    end

    before do
      json = { 'Content-Type' => 'application/json' }
      stub_request(:get, users_url).with(query: hash_including({})).to_return(
        { status: 200, body: page((1..10).to_a, 'cursor-1'), headers: json },
        { status: 200, body: page((11..20).to_a, 'cursor-2'), headers: json },
        { status: 200, body: page((21..25).to_a, nil), headers: json }
      )
    end

    it 'keeps paginating past limit' do
      expect(client.get_users(limit: 10).to_a.size).to eq(25)
    end

    it 'stops at take(n)' do
      expect(client.get_users(sort: '+last_login').take(10).size).to eq(10)
    end

    it 'stops at max_results' do
      capped = OneLogin::Api::Client.new(client_id: 'test_id', client_secret: 'test_secret',
                                         max_results: 10)
      capped.instance_variable_set(:@access_token, 'test_token')
      capped.instance_variable_set(:@expiration, Time.now.utc + 3600)

      expect(capped.get_users.to_a.size).to eq(10)
    end
  end
end
