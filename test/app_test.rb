$LOAD_PATH.unshift '/home/pitbulk/proyectos/onelogin-ruby-sdk/lib'
require "onelogin"

client_id = #TODO
client_secret = #TODO
region = 'us'
max_results = 100

client = OneLogin::Api::Client.new(client_id: client_id, client_secret: client_secret, region: region, max_results: max_results)



privileges = client.get_privileges().take(10)

privilege = privileges[0]

name = "privilege_example";
version = "2018-05-18";

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

privilege = client.get_privilege(privilege.id)

statement2 = OneLogin::Api::Models::Statement.new(
    "Allow",
    [
        "apps:Get",
    ],
    ["*"]
)

statements = [
    statement1,
    statement2
]

privilege = client.update_privilege(privilege.id, name, version, statements)

privilege = client.get_privilege(privilege.id)

result = client.delete_privilege(privilege.id)

role_ids = client.get_roles_assigned_to_privilege(privilege.id).take(10)

role_id_1 = 139229
result = client.assign_roles_to_privilege(privilege.id, [role_id_1])

result = client.remove_role_from_privilege(privilege.id, role_id_1)

role_ids = client.get_roles_assigned_to_privilege(privilege.id).take(10)

user_ids = client.get_users_assigned_to_privilege(privilege.id).take(10)

client.assign_users_to_privilege(privilege.id, [34687020, 34690720])

client.remove_user_from_privilege(privilege.id, 34687020)

user_ids = client.get_users_assigned_to_privilege(privilege.id).take(10)

#saml_endpoint_response2 = client.get_saml_assertion("test_freeradius@example.com", "TODO", TODO,"TODO");
#mfa = saml_endpoint_response2.mfa
#saml_endpoint_response_after_verify = client.get_saml_assertion_verifying("TODO", mfa.devices[0].id, mfa.state_token);
#saml_endpoint_response_after_verify = client.get_saml_assertion_verifying("TODO", mfa.devices[0].id, mfa.state_token, nil, nil, false);
#saml_endpoint_response_after_verify = client.get_saml_assertion_verifying("TODO", mfa.devices[0].id, mfa.state_token, nil, nil, true);

#session_login_token_params = {
#    "username_or_email"=> "test_freeradius@example.com",
#    "password"=> "TODO",
#    "subdomain"=> "TODO"
#}
#session_token_data = client.create_session_login_token(session_login_token_params)

#client.get_session_token_verified(session_token_data.devices[0].id, session_token_data.state_token, nil, nil)
#client.get_session_token_verified(session_token_data.devices[0].id, session_token_data.state_token, nil, nil, false)
#client.get_session_token_verified(session_token_data.devices[0].id, session_token_data.state_token, nil, nil, true)

#new_user_params = {
#    "email"=> "testcreate_11111@example.com",
#    "firstname"=> "testcreate_11111_fn",
#    "lastname"=> "testcreate_11111_ln",
#    "username"=> "testcreate_11111@example.com"
#}
#created_user = client.create_user(new_user_params)

#users =  client.get_users()

#users.each(1) do |user|
#    puts user.id
#    puts user.username
#    puts user.state
#    puts ""
#end

#client.set_state_to_user(40324512, 2)

#users =  client.get_users()

#users.each(1) do |user|
#    puts user.id
#    puts user.username
#    puts user.state
#    puts ""
#end

#token = client.get_access_token()

#token2 = client.regenerate_token()

#result = client.revoke_token()

#rate_limit = client.get_rate_limits()

#users = client.get_users()


#xx = client.get_events(fields: 'id,user_id').take(12)

#i = 0
#client.get_events(fields: 'id,user_id', limit: 10).take(12).each do |event|
#    i = i +1    
#    puts i.to_s << ' ' << event.id.to_s << ' ' << event.user_id.to_s
#end

#require 'pry-byebug'
#debugger

#apps = client.get_user_apps(27030376)

#apps2 = client.get_user_apps(37321818)


#query_parameters = {
#	"email"=> "TODO"
#}
#users = client.get_users(query_parameters)

#query_parameters = {
#	"limit"=> "6"
#}
#users_2 = client.get_users(query_parameters)

#user = client.get_user(27030376)

#apps = client.get_user_apps(27030376)

#role_ids = client.get_user_roles(27030376)

#custom_attributes = client.get_custom_attributes()


#new_user_params = {
#    "email"=> "testcreate_11111@example.com",
#    "firstname"=> "testcreate_11111_fn",
#    "lastname"=> "testcreate_11111_ln",
#    "username"=> "testcreate_11111@example.com"
#}
#created_user = client.create_user(new_user_params)

#modified_user_params = {
#	"firstname"=> "testcreate_11111_fn_modified",
#}

#updated_user = client.update_user(34920374, modified_user_params)

#user = client.get_user(34920374)

#result = client.remove_role_from_user(34920374, [170000])
#user2 = client.get_user(34920374)

#result = client.set_password_using_clear_text(34920374, 'TODO', 'TODO')

#pw = 'TODO'
#salt = '11xxxx1'
#require 'digest'
#sha256 = Digest::SHA256.new
#hashed_salted_password = sha256.hexdigest("#{pw}#{salt}")
#result = client.set_password_using_hash_salt(34920374, hashed_salted_password, hashed_salted_password, "salt+sha256", salt)

#custom_attr = {
#	"lala" => "01010101"
#}
#result = client.set_custom_attribute_to_user(34920374, custom_attr)

#result = client.log_user_out(34920374)

#result = client.lock_user(34920374, 3)

#result = client.delete_user(34920374)


#session_login_token_params = {
#    "username_or_email"=> "email_test@example.com",
#    "password"=> "1234567",
#    "subdomain"=> "TODO"
#}
#session_token_data = client.create_session_login_token(session_login_token_params)

#cookie = client.create_session_via_token(session_token_data.session_token)

#session_login_token_mfa_params = {
#    "username_or_email"=> "testcreate_1@example.com",
#    "password"=> "1234567",
#    "subdomain"=> "TODO"
#}
#session_token_mfa_data = client.create_session_login_token(session_login_token_mfa_params)
#session_token_data2 = client.get_session_token_verified(session_token_mfa_data.devices[0].id, session_token_mfa_data.state_token, "71837700")

#roles = client.get_roles();

#role = client.get_role(139229)

#event_types = client.get_event_types()

#require 'pry-byebug'
#debugger
#client.get_event_types.each do |event_type|
#    puts event_type.name
#end


#unfiltered_events = client.get_events()

#query_events = {
#    'limit'=> 2
#}
#events = client.get_events(query_events)

#event = client.get_event(events[0].id)

#new_event_params = {
#    "event_type_id"=> 149,
#    "account_id"=> 89146,
#    "actor_system"=> "34",
#    "user_id"=> 27030376,
#    "user_name"=> "TODO",
#    "custom_message"=> "test creating event from ruby :)"
#}
#result = client.create_event(new_event_params)

#groups = client.get_groups()

#group = client.get_group(groups[1].id)

#saml_endpoint_response = client.get_saml_assertion("testapi@example.com", "TODO", "TODO", "TODO");

#saml_endpoint_response2 = client.get_saml_assertion("testapi2@example.com", "TODO", "TODO", "TODO");
#mfa = saml_endpoint_response2.mfa
#saml_endpoint_response_after_verify = client.get_saml_assertion_verifying("TODO", mfa.devices[0].id, mfa.state_token, "78395727", nil);

#url_link = client.generate_invite_link("testapi@example.com")

#sent = client.send_invite_link("testapi2@example.com", "TODO")

#apps = client.get_embed_apps("80e821a505ed0f2f234ca1eb621e39b8be8a0528", "email_test@example.com")

#require "debugger"
#debugger
#print apps

print client.error
print client.error_description
print client.error_attribute



token = client.prepare_token
pp token

#query = {
#    'auth_method' => "a"
#}
#apps = client.get_apps(query)

#app = client.get_app(29561)
#pp(app)

app_params = {
    "provisioning"=>{"enabled"=>true},
      "parameters"=> {
        "saml_username"=> {
          "label"=> "Email2",
          "provisioned_entitlements"=> false,
          "id"=> 9804,
          "skip_if_blank"=> false,
          "user_attribute_macros"=> "",
          "attributes_transformations"=> nil,
          "values"=> nil,
          "user_attribute_mappings"=> "samaccountname",
          "default_values"=> nil,
          "safe_entitlements_enabled"=> false
        }
      },
    "configuration"=> {
        "login_url"=>"http://loginurl2.com",
        "audience"=>"http://audience2.com",
        "recipient"=>"http://recipient2.com",
        "signature_algorithm"=>"SHA-256",
        "consumer_url"=>"http://consumerurl2.com"
    },
    "name"=>"MySAMLapp71",
    "tab_id"=>14622,
    "policy_id"=>nil,
    "allow_assumed_signin"=>false,
    "visible"=>false,
    "connector_id"=>912,
    "auth_method"=>2,
    "description"=>"MySAMLApp71",
    "notes"=>"mynotes71"
}


app_params2 = {
  "provisioning"=> {
    "enabled"=> false
  },
  "policy_id"=> nil,
  "parameters"=> {
    "username"=> {
      "skip_if_blank"=> nil,
      "values"=> nil,
      "label"=> "Username",
      "user_attribute_mappings"=> nil,
      "id"=> 12858,
      "default_values"=> nil,
      "provisioned_entitlements"=> nil,
      "user_attribute_macros"=> nil,
      "safe_entitlements_enabled"=> nil,
      "attributes_transformations"=> nil
    },
    "password"=> {
      "skip_if_blank"=> nil,
      "label"=> "Password",
      "user_attribute_mappings"=> nil,
      "id"=> 12859,
      "provisioned_entitlements"=> nil,
      "user_attribute_macros"=> nil,
      "safe_entitlements_enabled"=> nil,
      "attributes_transformations"=> nil
    }
  },
  "allow_assumed_signin"=> false,
  "tab_id"=> nil,
  "connector_id"=> 7120,
  "visible"=> true,
  "description"=> "description",
  "notes"=> nil,
  "name"=> "IDOR BASIC App"
}

app = client.create_app(app_params2)
pp(app)

#app = client.update_app(29569, app_params)
#

#print client.delete_app(29563)

#print client.error
#print client.error_description
#print client.error_attribute

#pp(app)

#app2 = client.get_app(29568)
#pp(app2)



#print client.error
#print client.error_description
#print client.error_attribute

#unless apps.nil? || apps.empty?
#    pp(apps[0])
#    print apps[0].get_auth_method_name

#    if apps.count > 1
#      pp(apps[1])
#      print apps[1].get_auth_method_name
#    end

#    if apps.count > 2
#      pp(apps[2])
#      print apps[2].get_auth_method_name
#    end
#end
#pp(apps[2])

#app = client.get_app(17346)
#pp(app)

print client.error
print client.error_description
print client.error_attribute



# Get Available Authentication Factors
#auth_factors = client.get_factors(35724498)
auth_factors = client.get_factors(35962095)

require 'pry-byebug'
debugger

# Enroll an Authentication Factor
#enroll_factor = client.enroll_factor(35962095, auth_factors.first.id, 'My Device', '+14156456830')
#enroll_factor = client.enroll_factor(35962095, 555685, 'My Device', '+14156456830')

# Get Enrolled Authentication Factors
#otp_devices = client.get_enrolled_factors(35962095)

# Activate an Authentication Factor
#enrollment_response = client.activate_factor(34008771, 312313)


# Verify an Authentication Factor
result = client.verify_factor(34008771, device_id=22, otp_token="4242342423")

# Remove a Factor
result = client.remove_factor(user_id, device_id)



query_events = {
    'limit'=> 10
}

#event_cursor = client.get_events(query_events)
#events = event_cursor.take(999)

events = client.get_events(query_events).take(999)
