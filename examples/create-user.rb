require 'onelogin'

client = OneLogin::Api::Client.new(
    client_id: 'ONELOGIN_CLIENT_ID',
    client_secret:'ONELOGIN_CLIENT_SECRET',
    region: 'us'
)

user = client.create_user(
  firstname: "Mick",
  lastname: "Fanning",
  email: "mick@onelogin.com",
  username: "mick"
)

puts user