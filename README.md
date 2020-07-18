# OneLogin Ruby SDK

This SDK will let you execute all the API methods, version/1, described
at https://developers.onelogin.com/api-docs/1/getting-started/dev-overview.

The toolkit is hosted on github. You can download it from:
* Lastest release: https://github.com/onelogin/onelogin-ruby-sdk/releases/latest
* Master repo: https://github.com/onelogin/onelogin-ruby-sdk/tree/master


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'onelogin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install onelogin


### Dependencies

* httparty

## Getting started

You'll need a OneLogin account and a set of API credentials before you get started.

If you don't have an account you can [sign up for a free developer account here](https://www.onelogin.com/developer-signup).

|||
|---|---|
|client_id|Required: A valid OneLogin API client_id|
|client_secret|Required: A valid OneLogin API client_secret|
|region| Optional: `us` or `eu`. Defaults to `us`   |
|max_results| Optional: Defaults to 1000  |
|timeout| Optional: Defaults to 60 (requires httparty > 0.16.2) |

```ruby
require 'onelogin'

client = OneLogin::Api::Client.new(
    client_id: '',
    client_secret:'',
    region: 'us'
)

# Now you can make requests
client.get_users
```

For all methods see Rubydoc of this SDK published at:
http://www.rubydoc.info/github/onelogin/onelogin-ruby-sdk


## Usage

### Errors and exceptions

OneLogin's API can return 400, 401, 403 or 404 when there was any issue executing the action. When that happens, the methods of the SDK will include error and errorMessage in the client. Use `error` and `error_description` of the Client to retrieve them.

```ruby
users = client.get_users

if users.nil?
    puts client.error
    puts client.error_description
end
```

In some scenarios there is an attribute not provided or invalid that causes the error,
when that happens in addition to the error_description a error_attribute is available
with the name of the attribute that caused the issue. Accesible at the client like:

```ruby
client.error_attribute
```

### Authentication

By default methods call internally to `get_access_token` if there is no valid access_token. You can also get tokens etc directly if needed.

```ruby
# Get an AccessToken
token = client.get_access_token

# Refresh an AccessToken
token2 = client.regenerate_token

# Revoke an AccessToken
token3 = client.get_access_token
```

### Paging
All OneLogin API endpoints that support paging are returned as enumerations to save you keeping track of the paging cursor.

User `take` to limit the results or get all results by enumerating.

e.g.
```ruby
# List the first name of all users
client.get_users.each do |user|
    puts user.firstname
end

# List the first name of all users starting with the 2nd user
# `each` accepts a start param to skip first x results
client.get_users.each(1) do |user|
    puts user.firstname
end

# List the first 5 users with the name of Joe
client.get_users(firstname: 'Joe').take(5).each do |user|
    puts "#{user.firstname} #{user.lastname}"
end

# Get 10 event ids
client.get_events.take(10).map{|event| event.id }

# Get all roles
client.get_roles.to_a
```

For safety where some collections (e.g. `get_events`) have large numbers of resources there is a
limit of 1000 total results returned. You can override this with the `max_results` param during Client initialization.

```
client = OneLogin::Api::Client.new(
    client_id: '',
    client_secret:'',
    max_results: 50000
)

client.get_events.map {|event| event.id}
```



### Available Methods

```ruby
# Get rate limits
rate_limits = client.get_rate_limits

# Get Custom Attributes
custom_global_attributes = client.get_custom_attributes

# Get Users with no query parameters
users = client.get_users

# Get Users with query parameters
query_parameters = {
    email: "user@example.com"
}
users_filtered = client.get_users(query_parameters)

query_parameters = {
    email: "usermfa@example.com"
}
users_filtered2 = client.get_users(query_parameters)

# Get Users with limit
query_parameters = {
    limit: 3
}
users_filtered_limited = client.get_users(query_parameters)

# Only return the firstname and email fields for each user
client.get_users(fields: 'email,firstname').each do |user|
    puts "#{user.firstname} - #{user.email}"
end

# Get User by id
user = client.get_user(users_filtered.first.id)
user_mfa = client.get_user(users_filtered2.first.id)

# Update User with specific id
user = client.get_user(user.id)
update_user_params = user.get_user_params
update_user_params["firstname"] = 'modified_firstname'
user = client.update_user(user.id, update_user_params)
user = client.get_user(user.id)

# Get Global Roles
roles = client.get_roles

# Get Role
role = client.get_role(1234)

# Assign & Remove Roles On Users
role_ids = [
    1234, 5678
]
result = client.assign_role_to_user(user.id, role_ids)
role_ids.pop
result = client.remove_role_from_user(user.id, role_ids)
user = client.get_user(user.id)

# Sets Password by ID Using Cleartext
password = "Aa765431-XxX"
result = client.set_password_using_clear_text(user.id, password, password)

# Sets Password by ID Using Salt and SHA-256
password = "Aa765432-YyY"
salt = "11xxxx1"

require 'digest'
sha256 = Digest::SHA256.new
hashed_salted_password = sha256.hexdigest("#{pw}#{salt}")
result = client.set_password_using_hash_salt(user_mfa.id, hashed_salted_password, hashed_salted_password, "salt+sha256", salt)

 Set Custom Attribute Value to User
customAttributes = {
    custom_global_attributes[0]=> "xxxx",
    custom_global_attributes[1]=> "yyyy"
}
result = client.set_custom_attribute_to_user(34687020, customAttributes)

# Log Out User
result = client.log_user_out(user.id)

# Lock User
result = client.lock_user(user.id, 5)

# Get User apps
apps = client.get_user_apps(user.id)

# Get User Roles
role_ids = client.get_user_roles(user.id)

# Generate MFA Token
mfa_token = client.generate_mfa_token(user.id)

# Get all Connectors in a OneLogin account filtering by name*/
apps = client.get_connectors({name:'SAML'})

# Get all Apps in a OneLogin account using API v1 */
apps_v1 = client.get_apps_v1

# Get all Apps in a OneLogin account filtering by auth_method*/
apps = client.get_apps({auth_method:6})

# Create app
app_data = {
 name: "Created SAML App by API",
 description:"Created SAML App by API description",
 notes: "Created SAML App by API notes",
 auth_method: 2,
 policy_id: 167865,
 allow_assumed_signin: false,
 parameters: {
    saml_username: {
        user_attribute_mappings: "email",
        label: "NameID (fka Email)",
    }
 },
 connector_id: 110016,
 visible: true,
 configuration: {
   saml_initiater_id: "0",
   encrypt_assertion: "0",
   recipient: "http://sp.example.com/acs",
   saml_notbefore: "3",
   saml_nameid_format_id: "0",
   saml_issuer_type: "0",
   saml_sign_element: "0",
   consumer_url: "http://sp.example.com/acs",
   validator: ".*",
   relaystate: "",
   logout_url: "http://sp.example.com/sls",
   saml_encryption_method_id: "0",
   login: "http://sp.example.com/login",
   saml_sessionnotonorafter: "1440",
   generate_attribute_value_tags: "0",
   saml_notonorafter: "3",
   audience: "http://sp.example.com/audience",
   signature_algorithm: "SHA-256"
 }
}
app = client.create_app(app_data)

# Update app
app_data[:name] = "Created SAML App by API updated"
client.update_app(app.id, app_data)

# Get app
app = client.get_app(app.id)

# Delete app
result = client.delete_app(app.id)

# Delete parameter from app
result = client.delete_parameter_from_app(app.id, parameter_id)

# List users for a specific app
users = client.list_app_users(app.id)

# Create user
new_user_params = {
    email: "testcreate_1@example.com",
    firstname: "testcreate_1_fn",
    lastname: "testcreate_1_ln",
    username: "testcreate_1@example.com"
}
created_user = client.create_user(new_user_params)

# Delete User
result = client.delete_user(created_user.id)

# Get EventTypes
event_types = client.get_event_types

# Get Events
events = client.get_events

query_events_params = {
    limit: 2
}
events_limited = client.get_events(query_events_params)

# Get Event
event = client.get_event(events[0].id)

# Create Event
new_event_params = {
    event_type_id: "000",
    account_id: "00000",
    actor_system: "00",
    user_id: "00000000",
    user_name: "test_event",
    custom_message: "test creating event from python :)"
}
result = client.create_event(new_event_params)

# Get Filtered Events
query_events_params = array(
  user_id: "00000000"
)
events = client.get_events(query_events_params)

# Get Groups
groups = client.get_groups

# Get Group
group = client.get_group(groups.first.id)

# Get SAMLResponse directly
app_id = "000000"
saml_endpoint_response = client.get_saml_assertion("user@example.com", "Aa765431-XxX", app_id, "example-onelogin-subdomain")

# Get SAMLResponse after MFA
saml_endpoint_response2 = client.get_saml_assertion("usermfa@example.com", "Aa765432-YyY", app_id, "example-onelogin-subdomain")
mfa = saml_endpoint_response2.mfa
otp_token = "000000"
saml_endpoint_response_after_verify = client.get_saml_assertion_verifying(app_id, mfa.devices[0].id, mfa.state_token, "78395727", nil)

# Create Session Login Token
session_login_token_params = {
    username_or_email: "user@example.com",
    password: "Aa765431-XxX",
    subdomain: "example-onelogin-subdomain"
}
session_token_data = client.create_session_login_token(session_login_token_params)

# Create Session Login Token MFA , after verify
session_login_token_mfa_params = {
    username_or_email: "usermfa@example.com",
    password: "Aa765432-YyY",
    subdomain: "example-onelogin-subdomain"
}
session_token_mfa_data = client.create_session_login_token(session_login_token_mfa_params)
otp_token = "000000" # We get this value from OTP device
session_token_data2 = client.get_session_token_verified(session_token_mfa_data.devices.first.id,session_token_mfa_data.state_token, otp_token)

user_id = 00000000
# Get Available Authentication Factors
auth_factors = client.get_factors(user_id)

# Enroll an Authentication Factor
enroll_factor = client.enroll_factor(user_id, auth_factors.first.id, 'My Device', '+14156456830')

# Get Enrolled Authentication Factors
otp_devices = client.get_enrolled_factors(user_id)

# Activate an Authentication Factor
device_id = 0000000
enrollment_response = client.activate_factor(user_id, device_id)

# Verify an Authentication Factor
result = client.verify_factor(user_id, device_id, otp_token="4242342423")

# Remove a Factor
result = client.remove_factor(user_id, device_id)

# Generate Invite Link
url_link = client.generate_invite_link("user@example.com")

# Send Invite Link
sent = client.send_invite_link("user@example.com")

#Get Apps to Embed for a User
embed_token = "30e256c101cd0d2e731de1ec222e93c4be8a1572"
apps = client.get_embed_apps("30e256c101cd0d2e731de1ec222e93c4be8a1572", "user@example.com")

# Get Privileges
privileges = client.get_privileges()

# Create Privilege
name = "privilege_example"
version = "2018-05-18"

statement1 = OneLogin::Api::Models::Statement.new(
    "Allow",
    [
        "users:List",
        "users:Get",
    ],
    ["*"]
)

statement2 = OneLogin::Api::Models::Statement.new(
    "Allow",
    [
        "apps:List",
        "apps:Get",
    ],
    ["*"]
)

statements = [
    statement1,
    statement2
]
privilege = client.create_privilege(name, version, statements)

# Update Privilege
name = "privilege_example_updated"
statement2 = OneLogin::Api::Models::Statement.new(
    "Allow",
    [
        "apps:List",
    ],
    ["*"]
)
statements = [
    statement1,
    statement2
]
privilege = client.update_privilege(privilege.id, name, version, statements)

# Get Privilege
privileges = client.get_privilege(privilege.id)

# Delete Privilege
result = client.delete_privilege(privilege.id)

# Gets a list of the roles assigned to a privilege
assigned_roles = client.get_roles_assigned_to_privilege(privilege.id)

# Assign roles to a privilege
result = client.assign_roles_to_privilege(privilege.id, [role_id1, role_id2])

# Remove role from a privilege
result = client.remove_role_from_privilege(privilege.id, role_id_1)

# Gets a list of the users assigned to a privilege
assigned_users = client.get_users_assigned_to_privilege(privilege.id)

# Assign users to a privilege
result = client.assign_users_to_privilege(privilege.id, [user_id1, user_id2])

# Remove user from a privilege
result = client.remove_user_from_privilege(privilege.id, user_id2)
```

## Proxy Servers
If you're stuck behind a proxy then you can still use this SDK by providing at a minimum the
host address of your proxy server.

```ruby
client = OneLogin::Api::Client.new(
  client_id: 'some-client-id',
  client_secret:'some-client-secret',
  region: 'us',
  proxy_host: 'https://blah.com',
  proxy_port: '8080',
  proxy_user: 'username',
  proxy_pass: 'password'
)
```

* `proxy_host` - required, the host address of your proxy server
* `proxy_port` - optional, the port number of your proxy server
* `proxy_user` - optional, the username for your proxy server
* `proxy_pass` - optional, the password for your proxy server

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/onelogin/onelogin-ruby-sdk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the OneLogin Ruby Sdk project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/onelogin/onelogin-ruby-sdk/blob/master/CODE_OF_CONDUCT.md).
