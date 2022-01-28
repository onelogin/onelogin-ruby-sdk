require 'onelogin'

client = OneLogin::Api::Client.new(
    client_id: '9a19e9b07257c30ed3eddc0f9cf8d4127b4387646940acc8432c0dbcbd5f0c0d',
    client_secret: 'd5cfcbe70b626f1d131f632c398b5b0d60dbc149b9ad9a55ac33715c7239acf7',
    region: 'us',
    max_results: 50000
)

client.access_token

unless client.error.nil?
  puts "Error #{client.error}  #{client.error_description}"
  exit
end


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
login_app_event_csv_name = now_str + '_login_app_events.csv'
login_event_csv_name = now_str + '_login_events.csv'
radius_event_csv_name = now_str + '_radius_events.csv'

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

csv_login_app_event_header = ['Timestamp', 'Description', 'Username', 'App', 'IP Address', 'User Id', 'App Id', 'Email']
csv_login_event_header = ['Timestamp', 'Description', 'Username', 'IP Address', 'User Id', 'Email']

puts "Extracting login app events from OneLogin"
counter = 0
CSV.open(login_app_event_csv_name, 'wb') do |csv|
  # header row
  csv << csv_login_app_event_header

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
puts "Exported #{counter} login app events to  #{login_app_event_csv_name}"

rate_limits = client.get_rate_limits
remaining_after = rate_limits.remaining
puts "Remaining RateLimit: #{remaining_after}"


event_options[:event_type_id] = 5;
puts "Extracting login events from OneLogin"
counter = 0
CSV.open(login_event_csv_name, 'wb') do |csv|
  # header row
  csv << csv_login_event_header

  # fetch the events
  client.get_events(event_options).each do |event|
    username = email = ""
    description = "#{event.user_name} logged into OneLogin"
    unless users.nil?
      if users.has_key?(event.user_id)
        username = users[event.user_id].username
        email = users[event.user_id].email
      end
    end
    csv << [event.created_at, description, username, event.ipaddr, event.user_id, email]
    counter +=1
  end
end
puts "Exported #{counter} login events to #{login_event_csv_name}"

rate_limits = client.get_rate_limits
remaining_after = rate_limits.remaining
puts "Remaining RateLimit: #{remaining_after}"


event_options[:event_type_id] = 68;
puts "Extracting login radius events from OneLogin"
counter = 0
CSV.open(radius_event_csv_name, 'wb') do |csv|
  # header row
  csv << csv_login_event_header

  # fetch the events
  client.get_events(event_options).each do |event|
    username = email = ""
    description = "#{event.user_name} logged via Radius"
    unless users.nil?
      if users.has_key?(event.user_id)
        username = users[event.user_id].username
        email = users[event.user_id].email
      end
    end
    csv << [event.created_at, description, username, event.ipaddr, event.user_id, email]
    counter +=1
  end
end
puts "Exported #{counter} radius events to #{radius_event_csv_name}"

rate_limits = client.get_rate_limits
remaining_after = rate_limits.remaining
puts "Remaining RateLimit: #{remaining_after}"


consumed = remaining_before - remaining_after
puts "The script consumed #{consumed} calls"
