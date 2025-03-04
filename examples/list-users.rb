require 'onelogin'

client = OneLogin::Api::Client.new(
    client_id: 'ONELOGIN_CLIENT_ID',
    client_secret:'ONELOGIN_CLIENT_SECRET',
    region: 'us'
)

# List all of the users in your account
# the sdk uses a cursor to keep requesting
# chunks of users as you loop through

#puts client.get_users
#puts client.get_user(241015312)
#puts client.get_user_apps(241015312)
#puts client.get_user_roles(241015312)
#puts client.get_custom_attributes

# user = client.create_user(
#    firstname: "Mick61",
#   lastname: "Fanning",
#   email: "mick61@onelogin.com",
#   username: "mick61"
# )
# puts user

# user = client.update_user(247555538, {
#   "lastname":"Faming-Test",
#   "state":3
# })


# puts user

#puts client.delete_user(246747934)

#puts client.get_custom_attribute(106461)

# custom_attribute = client.create_custom_attribute(user_field: {"name":"Custom Field1","shortname":"customfield1"})
# puts custom_attribute

#  custom_attribute = client.update_custom_attribute(106473,user_field: {
#   "shortname":"test"
#  })

# puts custom_attribute
#puts client.delete_custom_attribute(106474)


#Roles API Testing
#puts client.get_roles
#puts client.get_role(799770)
# role = client.create_role({"name": "testroleapicreatetwo"})
# puts role

#  role_update = client.update_role(799770,{
#   "name":"test"
#  })

# puts role_update
#puts client.delete_role(800416)

#puts client.get_role_apps(749390)
# role_update = client.set_role_apps(799770,[3411502])

#  puts role_update
 #puts client.get_role_for_users(799770,"kmlkl")
 #puts client.get_role_for_admins(799770,"dubey") 

  # role_update = client.add_role_for_users(799770,[246747895])

#  puts role_update

  # role_update = client.add_role_for_admins(800414,[241015312])

  # puts role_update

# puts client.remove_role_from_admins(800414,[241015312])
#puts client.remove_role_from_admins(799770,[246747895])

#  puts client.get_reports
# puts client.run_report(3)
# puts client.run_report_background(3)

# saml_assertion = client.get_saml_assertion("anjani.dubey+mick@onelogin.com","password","3738336","anjani","123.45.678.9")
#  #puts saml_assertion

#  state_token=saml_assertion['data']
#  p state_token
#  saml_verify_factor = client.get_saml_assertion_verifying("3738336","20208361",state_token)
#  puts saml_verify_factor

#  puts client.get_hooks
    #puts client.get_hook("1bfc57ce-f35a-46f7-868a-01a7595505ef")
#  puts client.get_hook_logs("3e9d9086-3e0f-4321-87c2-398000b5dece")

# hook = client.create_hook({"type": "pre-authentication",
# "function": "",
# "disabled": false,
# "runtime": "nodejs12.x",
# "retries": 0,
# "timeout": 1,
# "options": {
#   "risk_enabled": true,
#   "location_enabled": false,
#   "mfa_device_info_enabled": true
# },
# "env_vars": [
#   "API_KEY"
# ],
# "packages": {
#   "axios": "0.21.1"
# },
# "conditions": [
#   {
#       "source": "roles",
#       "operator": "~",
#       "value": "123456"
#   }
# ]})
#  puts hook

  # puts client.delete_hook("3e9d9086-3e0f-4321-87c2-398000b5dece")
# env = client.create_env_var_hook({
#   "name": "API_KEY1",
#   "value": "helloworld1"
# })
# puts env


# hook_upd= client.update_hook("3e9d9086-3e0f-4321-87c2-398000b5dece",{
#   "type": "pre-authentication",
#   "function": "",
#   "disabled": false,
#   "runtime": "nodejs18.x",
#   "retries": 0,
#   "timeout": 1,
#   "options": {
#     "risk_enabled": true,
#     "location_enabled": false,
#     "mfa_device_info_enabled": true    
#   },
#   "env_vars": [
#     "API_KEY"
#   ],
#   "packages": {
#     "axios": "0.21.1"    
#   },
#   "conditions": [
#     {
#         "source": "roles",
#         "operator": "~",
#         "value": "123456"
#     }
#   ]  
#    })

#    puts hook_upd

#  puts client.get_env_var_hook("213387fe-188a-44ba-b17f-03331100a4a1")

#  puts client.list_env_var_hook

# env_upd= client.update_env_var_hook("9ec07793-b84a-4e1e-9029-fb79952f64ac",{
#     "value":"helloworld"
#    })

#    puts env_upd

# puts client.delete_env_var_hook("9ec07793-b84a-4e1e-9029-fb79952f64ac")

#  puts client.get_user_mappings


#puts client.get_user_mapping(716668)

#puts client.delete_user_mapping(716668)
# user_mapping= client.create_user_mapping({
    
#       "name": "My second Mapping",
#       "match": "all",
#       "enabled": true,
  
#       "conditions": [
#           {
#               "source": "last_login",
#               "operator": ">",
#               "value": "90"
#           }
#       ],
#       "actions": [
#           {
#               "action": "set_status",
#               "value": ["2"]
#           }
#       ]
  
#    })

#    puts user_mapping

# user_mapping_upd= client.update_user_mapping(716670,{
#   "name": "Suspend users after 120 days inactive",
#   "match": "all",
#   "enabled": true,
#   "position": 1,
#   "conditions": [
#       {
#           "source": "last_login",
#           "operator": ">",
#           "value": "120"
#       }
#   ],
#   "actions": [
#       {
#           "action": "set_status",
#           "value": ["2"]
#       }
#   ]
#    })

#    puts user_mapping_upd

# dry_run= puts client.dry_run_user_mapping(716667,[246747895])
# puts dry_run

# puts client.get_user_mapping_conditions
# puts client.get_user_mapping_condition_operators("member_of")
# puts client.get_user_mapping_condition_values("has_role")
# puts client.get_user_mapping_condition_actions
# puts client.get_user_mapping_action_values("add_role")

# bulk_sort= client.user_mapping_bulk_sort([716670,716667])
# puts bulk_sort

# risk_rules= client.create_risk_rules({
#   "name": "IP Blocklist for Guests test",
#   "description": "Blocklist for guest account users test",
#   "type": "blacklist",
#   "target": "location.ip",
#   "source": "guest-123",
#   "filters": ["123.123.123.123"]
# })

#    puts risk_rules

#  puts client.get_risk_rules
  # puts client.get_risk_scores
#  puts client.get_risk_rule(2865830758864389298)
  #puts client.delete_risk_rule(2865830758864389298)

# risk_rules_upd= client.update_risk_rules(2865830758864389298,{
#   "filters": ["123.123.123.123", "1.1.1.1"]
# })

#    puts risk_rules_upd


# risk_events= client.track_risk_events(
#   {
#   "ip": "1.2.3.4",
#   "verb": "log-in",
#   "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3)...",
#   "user": {
#     "id": "US_112233",
#     "name": "Eve Smith"
#   },
#   "source": {
#     "id": "1234",
#     "name": "ABC Inc"
#   },
#   "session": {
#     "id": "xxxx-xxxxx-xxxxx-xxxxx"
#   },
#   "device": {
#     "id": "xxx-xxx-xxx"
#   }
# })

#    puts risk_events


# risk_verify= client.verify_risk_score(
#   {
#   "ip": "1.2.3.4",
#   "verb": "log-in",
#   "user_agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_3)...",
#   "user": {
#     "id": "US_112233",
#     "name": "Eve Smith"
#   },
#   "source": {
#     "id": "1234",
#     "name": "ABC Inc"
#   },
#   "session": {
#     "id": "xxxx-xxxxx-xxxxx-xxxxx"
#   },
#   "device": {
#     "id": "xxx-xxx-xxx"
#   }
# })

#    puts risk_verify


#App and app rule api testing

# app= client.create_app(
#   {
#     "connector_id": 110016,
#     "name": "SAML Custom Connector (Advanced)",
#     "description": "",
#     "visible": true,
#     "configuration": {
#        "signature_algorithm": "SHA-1",
#        },
#     "parameters": {
#        "saml_username": {
#             "user_attribute_mappings": "email"
#             }
#        }
#   })

#    puts app

#puts client.get_apps
#puts client.get_app(3411502)
#puts client.get_app_users(3411502)
#  puts client.get_app_rules(3413059)
#  puts client.get_app_rule(3413059, 689151)
# app_rules= client.create_apps_rules(3413059,{ 
#   "name": "My Second Rule",
#   "match": "all",
#   "enabled": true,

#   "conditions": [
#       {
#           "source": "last_login",
#           "operator": ">",
#           "value": "90"
#       }
#   ],
#   "actions": [
#       {
#           "action": "set_nameidvalue",
#           "value": ["member_of"]
#       }
#   ]
# })

  #  puts app_rules


  # upd_app_rule= client.update_apps_rules(3413059, 722787,
  #   {
  #     "name": "Suspend users after 120 days inactive",
  #     "match": "all",
  #     "enabled": true,
  #     "position": 1,
  #     "conditions": [
  #         {
  #             "source": "last_login",
  #             "operator": ">",
  #             "value": "120"
  #         }
  #     ],
  #     "actions": [
  #         {
  #            "action": "set_nameidvalue",
  #            "value": ["member_of"]
  #         }
  #     ]
  # })

  #   puts upd_app_rule

  # puts client.get_app_rule_conditions(3411502)

    # puts client.get_app_rule_condition_operators(3411502, "member_of")
    # puts client.get_app_rule_condition_values(3411502, "has_role")



   #puts client.get_app_rule_actions(3411502)

    # puts client.get_app_rule_action_operators(3411502, "member_of")
    # puts client.get_app_rule_action_values(3411502, "set_role")

#     bulk_sort_app_rule= client.app_rule_bulk_sort(3413059,[689151,689154])
#  puts bulk_sort_app_rule

  # puts client.delete_app_rule(3413059, 689151)

  #  puts client.get_factors(246747885)
  #  puts client.get_enrolled_factors(246747885)

  #puts client.remove_factor(246747885,20208332)

#   activate_factor= client.activate_factor(246747885,{
#     "device_id": 20208361,
#     "expires_in": 240
# })

# puts activate_factor

# puts client.generate_mfa_token(246747885)

#   enroll_factor= client.enroll_factor(241015312,115341,"Mick2","+919584165249")

# puts enroll_factor

# puts client.verify_enrollement_voice_factor(241015312, "ae553021-d83c-4999-b273-83ff68ba56b9")


# auth_server= client.create_authorization_server({
#   "name": "Contacts API New for test",
#   "description": "This is a test api",
#   "configuration": {
#     "resource_identifier": "https://example.com/testcontacts",
#     "audiences": ["https://example.com/testcontacts"],
#     "access_token_expiration_minutes": 20,
#     "refresh_token_expiration_minutes": 50
#   }
# })

#    puts auth_server


  # puts client.get_authorization_servers
#  puts client.get_authorization_server(3767420)
#  auth_server= puts client.update_authorization_server(3767420,{
#   "name": "Contacts API New for delete",
#   "description": "This is a new api",
#   "configuration": {
#     "resource_identifier": "https://example.com/newcontacts",
#     "audiences": ["https://example.com/newcontacts"],
#     "access_token_expiration_minutes": 30,
#     "refresh_token_expiration_minutes": 70
#  }})
#  puts auth_server 
#  puts client.delete_authorization_server(3767420)

#  access_token= puts client.add_access_token_claims(3767529,{
#   "name": "roles",
#   "user_attribute_mappings": "roles",
#   "attributes_transformations": "semicolon_separated_list"
# })
#  puts access_token 

# puts client.get_access_token_claims(3767529)

#  access_token= puts client.update_access_token_claims(3767529,788490,{
#   "name": "roles",
#   "user_attribute_mappings": "roles",
#   "attributes_transformations": "semicolon_separated_list"
# })
#  puts access_token 

# puts client.delete_access_token_claims(3767529,788502)

#  scope= puts client.add_scopes(3767529,{
#   "value": "updated:scope",
#   "description": "A updated scope"
# })
#  puts scope 

#  puts client.get_scopes(3767529)

#  scope= puts client.update_scopes(3767529,3187,{
#   "value": "updated:scope",
#   "description": "A custom scope test"
# })
#  puts scope 

# puts client.delete_scope(3767529,3187)

# clients= puts client.add_clients_apps(3767529,
#   {
#     "app_id": 3768827,
#     "scopes": [3190]
# })
#  puts clients 

  #  puts client.get_clients_apps(3767529)

#   clients= puts client.update_clients_apps(3767529,3768827,{
#     "scopes": [3190, 3191]
# })
#  puts clients 

#  puts client.delete_clients_apps(3767529,3768827)


#  puts client.get_brands

# brand = client.create_account_brand(
#   {
#     "enabled": true,
#     "name": "Test Branding",
#     "custom_support_enabled": false,
#     "custom_color": "#1298b4",
#     "custom_accent_color": "#b60012",
#     "custom_masking_color": "#beefed",
#     "custom_masking_opacity": 40,
#     "enable_custom_label_for_login_screen": true,
#     "custom_label_text_for_login_screen": "ACME Username or Email",
#     "login_instruction_title": "ACME Login Instructions",
#     "login_instruction": "To login, enter your ACME Username or Email. Reach out to help.desk@acme.org if you have trouble logging in.",
#     "hide_onelogin_footer": true,
#     "mfa_enrollment_message": "You must register with the OneLogin Protect app in order to login"
# }
# )
# puts brand

# puts client.get_brand(189323)

# brand = client.update_brand(189323, {
#     "enabled": false,
#     "name": "Update Branding",
#     "custom_support_enabled": false,
#     "custom_color": "#1298b4"

# })


# puts brand

# puts client.delete_brand(189323)

# puts client.get_apps_assosiated_with_brand(189324)

# puts client.get_message_templates(189324)


# mt = client.create_message_templates(189324, 
# {
#   "locale": "en",
#   "type": "email_code_app_verification",
#   "template": {
#       "subject": "Email MFA App Verification Code for update",
#       "html": "<html><head></head><body><p>Here is the code: {{otp_code}}</p></body></html>",
#       "plain": "Here is the code to test: {{otp_code}}"
#   }
# }
# )
# puts mt

# puts client.get_message_template(189324, 547842)


# mt = client.update_message_template(189324, 547842, 
# {
#   "locale": "en",
#   "type": "email_code_app_verification",
#   "template": {
#       "subject": "Email MFA App Verification Code for updated one",
#       "html": "<html><head></head><body><p>Here is the code: {{otp_code}}</p></body></html>",
#       "plain": "Here is the code to update: {{otp_code}}"
#   }
# }
# )
# puts mt

# puts client.delete_message_template(189324, 547842)


#  puts client.get_message_template_by_type(189324, 'email_code_app_verification')

# puts client.get_message_template_by_type_and_locale(189324, 'email_code_app_verification', 'en')

# puts client.get_master_message_template_by_type('email_code_app_verification')

# puts client.get_master_message_template_by_typeand_locale('email_code_app_verification', 'en')


# mtu = client.update_message_template_by_type_and_locale(189324, 'email_code_app_verification', 'en',
# {
#     "template": {
#         "subject": "Email MFA App Verification Code",
#         "html": "<html><head></head><body><p>Here is the code: {{otp_code}}</p></body></html>",
#         "plain": "Here is the code: {{otp_code}}"
#     }
# }
# )
# puts mtu

# puts client.get_languages(189324)

# puts client.get_languages(189324)

# puts client.get_custom_messages(189324)

# puts client.get_email_settings
