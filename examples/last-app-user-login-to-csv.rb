require 'onelogin'
require 'optparse'
require 'optparse/time'

#
# This generates a report listing the last login date for all users who have logged into a specified app in the last x days.
#
# Usage:
# 1. Set your own CLIENT_ID and CLIENT_SECRET below
# 2. From terminal run "ruby last-app-user-login-to-csv.rb"
# 3. Use the command line args to filter events
#
# e.g. "ruby last-app-user-login-to-csv.rb -l 90" for last 90 days
#


# Parse CLI arguments
options = {
  event_type_id: 8, # User Logged into an App
  sort: '-created_at'
}

OptionParser.new do |opts|
  opts.banner = "Usage: last-app-user-login-to-csv.rb [options]"

  opts.on("-lLAST", "--LAST=LAST", Integer, "Events since this many days ago") do |d|
    now = Date.today
    days_ago = (now - d)
    options[:since] = days_ago.strftime('%Y-%m-%dT%H:%M:%SZ')
  end

end.parse!

client = OneLogin::Api::Client.new(
  client_id: 'ONELOGIN_CLIENT_ID_GOES_HERE',
  client_secret: 'ONELOGIN_CLIENT_SECRET_GOES_HERE',
  region: 'us',
  max_results: 50000
)

counter = 0

logins = {}

# build a hash from events which contains user_id and latest login date
client.get_events(options).each do |event|
  key = "#{event.app_id}-#{event.user_id}"

  unless logins[key]
    logins[key] = {
      app_id: event.app_id,
      app_name: event.app_name,
      user_id: event.user_id,
      user_name: event.user_name,
      last_login_at: event.created_at
    }
  end
end

CSV.open('last-login-by-app.csv', 'wb') do |csv|
  puts "Exporting user logins to last-login-by-app.csv"

  # header row
  csv << ['app_id', 'app_name', 'user_id', 'user_name', 'last_login_at']

  logins.each do |login|
    csv << login[1].values
    counter += 1
  end
end

puts "Exported #{counter} user logins to last-login-by-app.csv"
