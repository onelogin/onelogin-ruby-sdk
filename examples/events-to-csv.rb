require 'onelogin'
require 'optparse'
require 'optparse/time'

#
# This example shows how you can export events from OneLogin using the Ruby SDK
#
# Usage:
# 1. Set your own CLIENT_ID and CLIENT_SECRET below
# 2. From terminal run "ruby events-to-csv.rb" for the last 1000 events
# 3. Use the command line args to filter events
#
# e.g. "ruby events-to-csv.rb -t 5 -s 2018-01-01" for login events since Jan 1 2018
#


# Parse CLI arguments
options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: events-to-csv.rb [options]"

  opts.on("-sSINCE", "--since=SINCE", Time, "Events after this date") do |s|
    options[:since] = s.iso8601
  end

  opts.on("-dLAST", "--last=LAST", Integer, "Events since this many days ago") do |d|
    now = Date.today
    days_ago = (now - d)
    options[:since] = days_ago.strftime('%Y-%m-%dT%H:%M:%SZ')
  end

  opts.on("-bUNTIL", "--until=UNTIL", Time, "Events before this date") do |u|
    options[:until] = u.iso8601
  end

  opts.on("-lLIMIT", "--limit=LIMIT", Integer, "Only return this many events, Default 1000") do |l|
    options[:limit] = l
  end

  opts.on("-tTYPE", "--type=TYPE", Integer, "Filter by event type id") do |t|
    options[:event_type_id] = t
  end

  opts.on("-uUSER", "--user=USER", Integer, "Filter by user id") do |u|
    options[:user_id] = u
  end

  # Sort direction is done by adding a + or - before the field name that you want to sort on
  opts.on("-zSORT", "--sort=SORT", String, "Sort by this field") do |s|
    options[:sort] = s
  end
end.parse!

counter = 0
limit = options[:limit] || 1000

# Fetch the events
client = OneLogin::Api::Client.new(
  client_id: 'ONELOGIN_CLIENT_ID_GOES_HERE',
  client_secret: 'ONELOGIN_CLIENT_SECRET_GOES_HERE',
  region: 'us',
  max_results: limit
)

attribute_names = ['id', 'created_at', 'account_id', 'user_id', 'user_name', 'event_type_id',
                  'notes', 'ipaddr', 'actor_user_id', 'actor_user_name', 'assuming_acting_user_id',
                  'role_id', 'role_name', 'app_id', 'app_name', 'group_id', 'group_name', 'otp_device_id',
                  'otp_device_name', 'policy_id', 'policy_name', 'actor_system', 'custom_message',
                  'operation_name', 'directory_sync_run_id', 'directory_id', 'resolution', 'client_id',
                  'resource_type_id', 'error_description', 'risk_score', 'risk_reasons', 'risk_cookie_id', 'browser_fingerprint']

# We remove limit from options parsed to the api as we want to fetch
# the max number of records possible and then use the cursor that is
# built into the ruby sdk to limit the results
options.delete(:limit)

CSV.open('events.csv', 'wb') do |csv|
  puts "Exporting events to events.csv"

  # header row
  csv << attribute_names

  # fetch the events
  client.get_events(options).take(limit).each do |event|
    csv << attribute_names.map { |attribute_name| event.send(attribute_name) if event.respond_to?(attribute_name) }
    counter += 1
  end
end

puts "Exported #{counter} events to events.csv"



