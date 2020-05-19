require 'onelogin'

#
# This example shows how you can export user details from OneLogin using the Ruby SDK
#
# Usage:
# 1. Set your own CLIENT_ID and CLIENT_SECRET below
# 2. From terminal run "ruby all-users-to-csv.rb" to extract all users including
#    any custom attributes that might have been defined for the each user
#

#client = OneLogin::Api::Client.new(
#    client_id: 'ONELOGIN_CLIENT_ID',
#    client_secret:'ONELOGIN_CLIENT_SECRET',
#    region: 'us',
#    max_results: 50000
#)
client = OneLogin::Api::Client.new(
    client_id: 'ONELOGIN_CLIENT_ID_GOES_HERE',
    client_secret: 'ONELOGIN_CLIENT_SECRET_GOES_HERE',
    region: 'us',
    max_results: 50000
)


user_attribute_names = ['id', 'username', 'email']
event_attribute_names = ['created_at', 'user_id', 'user_name', 'ipaddr', 'app_id', 'app_name']
csv_event_header = ['Timestamp', 'Description',  'Username', 'App', 'IP Address', 'User Id', 'Email', 'App Id']

user_options = {}
user_options[:fields] = user_attribute_names.join(",")


now = Date.today
days_ago = (now - 1)
event_options = {}
event_options[:since] = days_ago.strftime('%Y-%m-%dT%H:%M:%SZ')
event_options[:event_type_id] = 8;
event_options[:fields] = event_attribute_names.join(",")
event_options[:sort] = "-created_at"

now_str = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
event_csv_name = now_str + '_events.csv'

users = {}
counter = 0

rate_limits = client.get_rate_limits
remaining_before = rate_limits.remaining
puts "Remaining RateLimit: #{remaining_before}"

puts "Extracting users from OneLogin"

client.get_users(user_options).each do |user|
  users[user.id] = user
  counter +=1
end
puts "#{counter} users extracted"

puts "Extracting events from OneLogin"
csv_event_header = ['Timestamp', 'Description', 'Username', 'App', 'IP Address', 'User Id', 'App Id', 'Email']
counter = 0
CSV.open(event_csv_name, 'wb') do |csv|
  # header row
  csv << csv_event_header

  # fetch the events
  client.get_events(event_options).each do |event|
    username = email = ""
    description = "#{event.user_name} signed into #{event.app_name}"
    unless users.nil?
      if users.has_key?(event.user_id)
        username = users[event.user_id].username
        email = users[event.user_id].email
      end
    end
    csv << [event.created_at, description, username, event.app_name, event.ipaddr, event.user_id, event.app_id, email]
    counter +=1
  end
end
puts "Exported #{counter} events to events.csv"

rate_limits = client.get_rate_limits
remaining_after = rate_limits.remaining
puts "Remaining RateLimit: #{remaining_after}"

consumed = remaining_before - remaining_after
puts "The script consumed #{consumed} calls"
