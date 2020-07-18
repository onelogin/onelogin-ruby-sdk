require 'onelogin'

client = OneLogin::Api::Client.new(
    client_id: 'ONELOGIN_CLIENT_ID',
    client_secret:'ONELOGIN_CLIENT_SECRET',
    region: 'us'
)

# List all of the users in your account
# the sdk uses a cursor to keep requesting
# chunks of users as you loop through

client.get_users_v1.each do |user|
  puts "#{user.id} - #{user.firstname} - #{user.email}"
end
