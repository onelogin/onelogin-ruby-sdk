# OneLogin::DefaultApi

All URIs are relative to *https://onelogininc.onelogin.com*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**activate_factor**](DefaultApi.md#activate_factor) | **POST** /api/2/mfa/users/{user_id}/verifications |  |
| [**add_access_token_claim**](DefaultApi.md#add_access_token_claim) | **POST** /api/2/api_authorizations/{id}/claims |  |
| [**add_client_app**](DefaultApi.md#add_client_app) | **POST** /api/2/api_authorizations/{id}/clients |  |
| [**add_role_admins**](DefaultApi.md#add_role_admins) | **POST** /api/2/roles/{role_id}/admins |  |
| [**add_role_users**](DefaultApi.md#add_role_users) | **POST** /api/2/roles/{role_id}/users |  |
| [**add_scope**](DefaultApi.md#add_scope) | **POST** /api/2/api_authorizations/{id}/scopes |  |
| [**bulk_mapping_sort**](DefaultApi.md#bulk_mapping_sort) | **PUT** /api/2/apps/mappings/sort |  |
| [**bulk_sort**](DefaultApi.md#bulk_sort) | **PUT** /api/2/apps/{app_id}/rules/sort |  |
| [**create_app**](DefaultApi.md#create_app) | **POST** /api/2/apps |  |
| [**create_authorization_server**](DefaultApi.md#create_authorization_server) | **POST** /api/2/api_authorizations |  |
| [**create_environment_variable**](DefaultApi.md#create_environment_variable) | **POST** /api/2/hooks/envs |  |
| [**create_hook**](DefaultApi.md#create_hook) | **POST** /api/2/hooks |  |
| [**create_mapping**](DefaultApi.md#create_mapping) | **POST** /api/2/mappings |  |
| [**create_risk_rule**](DefaultApi.md#create_risk_rule) | **POST** /api/2/risk/rules |  |
| [**create_roles**](DefaultApi.md#create_roles) | **POST** /api/2/roles |  |
| [**create_rule**](DefaultApi.md#create_rule) | **POST** /api/2/apps/{app_id}/rules |  |
| [**create_user**](DefaultApi.md#create_user) | **POST** /api/2/users |  |
| [**delete_access_token_claim**](DefaultApi.md#delete_access_token_claim) | **DELETE** /api/2/api_authorizations/{id}/claims/{claim_id} |  |
| [**delete_app**](DefaultApi.md#delete_app) | **DELETE** /api/2/apps/{app_id} |  |
| [**delete_app_parameter**](DefaultApi.md#delete_app_parameter) | **DELETE** /api/2/apps/{app_id}/parameters/{parameter_id} |  |
| [**delete_authorization_server**](DefaultApi.md#delete_authorization_server) | **DELETE** /api/2/api_authorizations/{id} |  |
| [**delete_environment_variable**](DefaultApi.md#delete_environment_variable) | **DELETE** /api/2/hooks/envs/{envvar_id} |  |
| [**delete_factor**](DefaultApi.md#delete_factor) | **DELETE** /api/2/mfa/users/{user_id}/devices/{device_id} |  |
| [**delete_hook**](DefaultApi.md#delete_hook) | **DELETE** /api/2/hooks/{hook_id} |  |
| [**delete_mapping**](DefaultApi.md#delete_mapping) | **DELETE** /api/2/mappings/{mapping_id} |  |
| [**delete_risk_rule**](DefaultApi.md#delete_risk_rule) | **DELETE** /api/2/risk/rules/{risk_rule_id} |  |
| [**delete_role**](DefaultApi.md#delete_role) | **DELETE** /api/2/roles/{role_id} |  |
| [**delete_rule**](DefaultApi.md#delete_rule) | **DELETE** /api/2/apps/{app_id}/rules/{rule_id} |  |
| [**delete_scope**](DefaultApi.md#delete_scope) | **DELETE** /api/2/api_authorizations/{id}/scopes/{scope_id} |  |
| [**delete_user**](DefaultApi.md#delete_user) | **DELETE** /api/2/users/{user_id} |  |
| [**dry_run_mapping**](DefaultApi.md#dry_run_mapping) | **POST** /api/2/mappings/{mapping_id}/dryrun |  |
| [**enroll_factor**](DefaultApi.md#enroll_factor) | **POST** /api/2/mfa/users/{user_id}/registrations |  |
| [**generate_mfa_token**](DefaultApi.md#generate_mfa_token) | **POST** /api/2/mfs/users/{user_id}/mfa_token |  |
| [**generate_saml_assertion**](DefaultApi.md#generate_saml_assertion) | **POST** /api/2/saml_assertion |  |
| [**generate_token**](DefaultApi.md#generate_token) | **POST** /auth/oauth2/v2/token |  |
| [**get_app**](DefaultApi.md#get_app) | **GET** /api/2/apps/{app_id} |  |
| [**get_authorization_server**](DefaultApi.md#get_authorization_server) | **GET** /api/2/api_authorizations/{id} |  |
| [**get_available_factors**](DefaultApi.md#get_available_factors) | **GET** /api/2/mfa/users/{user_id}/factors |  |
| [**get_client_apps**](DefaultApi.md#get_client_apps) | **GET** /api/2/api_authorizations/{id}/clients |  |
| [**get_enrolled_factors**](DefaultApi.md#get_enrolled_factors) | **GET** /api/2/mfa/users/{user_id}/devices |  |
| [**get_environment_variable**](DefaultApi.md#get_environment_variable) | **GET** /api/2/hooks/envs/{envvar_id} |  |
| [**get_hook**](DefaultApi.md#get_hook) | **GET** /api/2/hooks/{hook_id} |  |
| [**get_logs**](DefaultApi.md#get_logs) | **GET** /api/2/hooks/{hook_id}/logs |  |
| [**get_mapping**](DefaultApi.md#get_mapping) | **GET** /api/2/mappings/{mapping_id} |  |
| [**get_rate_limit**](DefaultApi.md#get_rate_limit) | **GET** /auth/rate_limit |  |
| [**get_risk_rule**](DefaultApi.md#get_risk_rule) | **GET** /api/2/risk/rules/{risk_rule_id} |  |
| [**get_risk_score**](DefaultApi.md#get_risk_score) | **POST** /api/2/risk/verify |  |
| [**get_role**](DefaultApi.md#get_role) | **GET** /api/2/roles/{role_id} |  |
| [**get_role_admins**](DefaultApi.md#get_role_admins) | **GET** /api/2/roles/{role_id}/admins |  |
| [**get_role_apps**](DefaultApi.md#get_role_apps) | **GET** /api/2/roles/{role_id}/apps |  |
| [**get_role_users**](DefaultApi.md#get_role_users) | **GET** /api/2/roles/{role_id}/users |  |
| [**get_rule**](DefaultApi.md#get_rule) | **GET** /api/2/apps/{app_id}/rules/{rule_id} |  |
| [**get_score_insights**](DefaultApi.md#get_score_insights) | **GET** /api/2/risk/scores |  |
| [**get_user**](DefaultApi.md#get_user) | **GET** /api/2/users/{user_id} |  |
| [**get_user_apps**](DefaultApi.md#get_user_apps) | **GET** /api/2/users/{user_id}/apps |  |
| [**list_access_token_claims**](DefaultApi.md#list_access_token_claims) | **GET** /api/2/api_authorizations/{id}/claims |  |
| [**list_action_values**](DefaultApi.md#list_action_values) | **GET** /api/2/apps/{app_id}/rules/actions/{actuion_value}/values |  |
| [**list_actions**](DefaultApi.md#list_actions) | **GET** /api/2/apps/{app_id}/rules/actions |  |
| [**list_app_users**](DefaultApi.md#list_app_users) | **GET** /api/2/apps/{app_id}/users |  |
| [**list_apps**](DefaultApi.md#list_apps) | **GET** /api/2/apps |  |
| [**list_authorization_servers**](DefaultApi.md#list_authorization_servers) | **GET** /api/2/api_authorizations |  |
| [**list_condition_operators**](DefaultApi.md#list_condition_operators) | **GET** /api/2/apps/{app_id}/rules/conditions/{condition_value}/operators |  |
| [**list_condition_values**](DefaultApi.md#list_condition_values) | **GET** /api/2/apps/{app_id}/rules/conditions/{condition_value}/values |  |
| [**list_conditions**](DefaultApi.md#list_conditions) | **GET** /api/2/apps/{app_id}/rules/conditions |  |
| [**list_connectors**](DefaultApi.md#list_connectors) | **GET** /api/2/connectors |  |
| [**list_environment_variables**](DefaultApi.md#list_environment_variables) | **GET** /api/2/hooks/envs |  |
| [**list_hooks**](DefaultApi.md#list_hooks) | **GET** /api/2/hooks |  |
| [**list_mapping_action_values**](DefaultApi.md#list_mapping_action_values) | **GET** /api/2/apps/mappings/actions/{actuion_value}/values |  |
| [**list_mapping_actions**](DefaultApi.md#list_mapping_actions) | **GET** /api/2/apps/mappings/actions |  |
| [**list_mapping_condition_operators**](DefaultApi.md#list_mapping_condition_operators) | **GET** /api/2/apps/mappings/conditions/{condition_value}/operators |  |
| [**list_mapping_condition_values**](DefaultApi.md#list_mapping_condition_values) | **GET** /api/2/apps/mappings/conditions/{condition_value}/values |  |
| [**list_mapping_conditions**](DefaultApi.md#list_mapping_conditions) | **GET** /api/2/apps/mappings/conditions |  |
| [**list_mappings**](DefaultApi.md#list_mappings) | **GET** /api/2/mappings |  |
| [**list_risk_rules**](DefaultApi.md#list_risk_rules) | **GET** /api/2/risk/rules |  |
| [**list_roles**](DefaultApi.md#list_roles) | **GET** /api/2/roles |  |
| [**list_rules**](DefaultApi.md#list_rules) | **GET** /api/2/apps/{app_id}/rules |  |
| [**list_scopes**](DefaultApi.md#list_scopes) | **GET** /api/2/api_authorizations/{id}/scopes |  |
| [**list_users**](DefaultApi.md#list_users) | **GET** /api/2/users |  |
| [**remove_client_app**](DefaultApi.md#remove_client_app) | **DELETE** /api/2/api_authorizations/{id}/clients/{client_app_id} |  |
| [**remove_role_admins**](DefaultApi.md#remove_role_admins) | **DELETE** /api/2/roles/{role_id}/admins |  |
| [**remove_role_users**](DefaultApi.md#remove_role_users) | **DELETE** /api/2/roles/{role_id}/users |  |
| [**revoke_token**](DefaultApi.md#revoke_token) | **POST** /auth/oauth2/revoke |  |
| [**set_role_apps**](DefaultApi.md#set_role_apps) | **PUT** /api/2/roles/{role_id}/apps |  |
| [**track_event**](DefaultApi.md#track_event) | **POST** /api/2/risk/events |  |
| [**update_access_token_claim**](DefaultApi.md#update_access_token_claim) | **PUT** /api/2/api_authorizations/{id}/claims/{claim_id} |  |
| [**update_app**](DefaultApi.md#update_app) | **PUT** /api/2/apps/{app_id} |  |
| [**update_authorization_server**](DefaultApi.md#update_authorization_server) | **PUT** /api/2/api_authorizations/{id} |  |
| [**update_client_app**](DefaultApi.md#update_client_app) | **PUT** /api/2/api_authorizations/{id}/clients/{client_app_id} |  |
| [**update_environment_variable**](DefaultApi.md#update_environment_variable) | **PUT** /api/2/hooks/envs/{envvar_id} |  |
| [**update_hook**](DefaultApi.md#update_hook) | **PUT** /api/2/hooks/{hook_id} |  |
| [**update_mapping**](DefaultApi.md#update_mapping) | **PUT** /api/2/mappings/{mapping_id} |  |
| [**update_risk_rule**](DefaultApi.md#update_risk_rule) | **PUT** /api/2/risk/rules/{risk_rule_id} |  |
| [**update_role**](DefaultApi.md#update_role) | **PUT** /api/2/roles/{role_id} |  |
| [**update_rule**](DefaultApi.md#update_rule) | **PUT** /api/2/apps/{app_id}/rules/{rule_id} |  |
| [**update_scope**](DefaultApi.md#update_scope) | **PUT** /api/2/api_authorizations/{id}/scopes/{scope_id} |  |
| [**update_user**](DefaultApi.md#update_user) | **PUT** /api/2/users/{user_id} |  |
| [**verify_enrollment**](DefaultApi.md#verify_enrollment) | **PUT** /api/2/mfa/users/{user_id}/registrations/{registration_id} |  |
| [**verify_enrollment_voice_protect**](DefaultApi.md#verify_enrollment_voice_protect) | **GET** /api/2/mfa/users/{user_id}/registrations/{registration_id} |  |
| [**verify_factor**](DefaultApi.md#verify_factor) | **PUT** /api/2/mfa/users/{user_id}/verifications/{verification_id} |  |
| [**verify_factor_saml**](DefaultApi.md#verify_factor_saml) | **POST** /api/2/saml_assertion/verify_factor |  |
| [**verify_factor_voice**](DefaultApi.md#verify_factor_voice) | **GET** /api/2/mfa/users/{user_id}/verifications/{verification_id} |  |


## activate_factor

> activate_factor(authorization, user_id, activate_factor_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user.
activate_factor_request = OneLogin::ActivateFactorRequest.new # ActivateFactorRequest | 

begin
  
  api_instance.activate_factor(authorization, user_id, activate_factor_request)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->activate_factor: #{e}"
end
```

#### Using the activate_factor_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> activate_factor_with_http_info(authorization, user_id, activate_factor_request)

```ruby
begin
  
  data, status_code, headers = api_instance.activate_factor_with_http_info(authorization, user_id, activate_factor_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->activate_factor_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user. |  |
| **activate_factor_request** | [**ActivateFactorRequest**](ActivateFactorRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## add_access_token_claim

> <Id> add_access_token_claim(authorization, id, add_access_token_claim_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 
add_access_token_claim_request = OneLogin::AddAccessTokenClaimRequest.new # AddAccessTokenClaimRequest | 

begin
  
  result = api_instance.add_access_token_claim(authorization, id, add_access_token_claim_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->add_access_token_claim: #{e}"
end
```

#### Using the add_access_token_claim_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Id>, Integer, Hash)> add_access_token_claim_with_http_info(authorization, id, add_access_token_claim_request)

```ruby
begin
  
  data, status_code, headers = api_instance.add_access_token_claim_with_http_info(authorization, id, add_access_token_claim_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Id>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->add_access_token_claim_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |
| **add_access_token_claim_request** | [**AddAccessTokenClaimRequest**](AddAccessTokenClaimRequest.md) |  |  |

### Return type

[**Id**](Id.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## add_client_app

> <ClientApp> add_client_app(authorization, id, add_client_app_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 
add_client_app_request = OneLogin::AddClientAppRequest.new # AddClientAppRequest | 

begin
  
  result = api_instance.add_client_app(authorization, id, add_client_app_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->add_client_app: #{e}"
end
```

#### Using the add_client_app_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ClientApp>, Integer, Hash)> add_client_app_with_http_info(authorization, id, add_client_app_request)

```ruby
begin
  
  data, status_code, headers = api_instance.add_client_app_with_http_info(authorization, id, add_client_app_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ClientApp>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->add_client_app_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |
| **add_client_app_request** | [**AddClientAppRequest**](AddClientAppRequest.md) |  |  |

### Return type

[**ClientApp**](ClientApp.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## add_role_admins

> <Array<AddRoleUsers200ResponseInner>> add_role_admins(authorization, role_id, request_body)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
role_id = 56 # Integer | Set to the id of the role you want to return.
request_body = [37] # Array<Integer> | 

begin
  
  result = api_instance.add_role_admins(authorization, role_id, request_body)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->add_role_admins: #{e}"
end
```

#### Using the add_role_admins_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<AddRoleUsers200ResponseInner>>, Integer, Hash)> add_role_admins_with_http_info(authorization, role_id, request_body)

```ruby
begin
  
  data, status_code, headers = api_instance.add_role_admins_with_http_info(authorization, role_id, request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<AddRoleUsers200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->add_role_admins_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **role_id** | **Integer** | Set to the id of the role you want to return. |  |
| **request_body** | [**Array&lt;Integer&gt;**](Integer.md) |  |  |

### Return type

[**Array&lt;AddRoleUsers200ResponseInner&gt;**](AddRoleUsers200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## add_role_users

> <Array<AddRoleUsers200ResponseInner>> add_role_users(authorization, role_id, request_body)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
role_id = 56 # Integer | Set to the id of the role you want to return.
request_body = [37] # Array<Integer> | 

begin
  
  result = api_instance.add_role_users(authorization, role_id, request_body)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->add_role_users: #{e}"
end
```

#### Using the add_role_users_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<AddRoleUsers200ResponseInner>>, Integer, Hash)> add_role_users_with_http_info(authorization, role_id, request_body)

```ruby
begin
  
  data, status_code, headers = api_instance.add_role_users_with_http_info(authorization, role_id, request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<AddRoleUsers200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->add_role_users_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **role_id** | **Integer** | Set to the id of the role you want to return. |  |
| **request_body** | [**Array&lt;Integer&gt;**](Integer.md) |  |  |

### Return type

[**Array&lt;AddRoleUsers200ResponseInner&gt;**](AddRoleUsers200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## add_scope

> <Id> add_scope(authorization, id, add_scope_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 
add_scope_request = OneLogin::AddScopeRequest.new # AddScopeRequest | 

begin
  
  result = api_instance.add_scope(authorization, id, add_scope_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->add_scope: #{e}"
end
```

#### Using the add_scope_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Id>, Integer, Hash)> add_scope_with_http_info(authorization, id, add_scope_request)

```ruby
begin
  
  data, status_code, headers = api_instance.add_scope_with_http_info(authorization, id, add_scope_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Id>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->add_scope_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |
| **add_scope_request** | [**AddScopeRequest**](AddScopeRequest.md) |  |  |

### Return type

[**Id**](Id.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## bulk_mapping_sort

> Array&lt;Integer&gt; bulk_mapping_sort(authorization, request_body)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
request_body = [37] # Array<Integer> | The request body must contain an array of User Mapping IDs in the desired order.

begin
  
  result = api_instance.bulk_mapping_sort(authorization, request_body)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->bulk_mapping_sort: #{e}"
end
```

#### Using the bulk_mapping_sort_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Array&lt;Integer&gt;, Integer, Hash)> bulk_mapping_sort_with_http_info(authorization, request_body)

```ruby
begin
  
  data, status_code, headers = api_instance.bulk_mapping_sort_with_http_info(authorization, request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Array&lt;Integer&gt;
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->bulk_mapping_sort_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **request_body** | [**Array&lt;Integer&gt;**](Integer.md) | The request body must contain an array of User Mapping IDs in the desired order. |  |

### Return type

**Array&lt;Integer&gt;**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## bulk_sort

> Array&lt;Integer&gt; bulk_sort(authorization, app_id, request_body)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
request_body = [37] # Array<Integer> | The request body must contain an array of App Rule IDs in the desired order.

begin
  
  result = api_instance.bulk_sort(authorization, app_id, request_body)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->bulk_sort: #{e}"
end
```

#### Using the bulk_sort_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Array&lt;Integer&gt;, Integer, Hash)> bulk_sort_with_http_info(authorization, app_id, request_body)

```ruby
begin
  
  data, status_code, headers = api_instance.bulk_sort_with_http_info(authorization, app_id, request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Array&lt;Integer&gt;
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->bulk_sort_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **request_body** | [**Array&lt;Integer&gt;**](Integer.md) | The request body must contain an array of App Rule IDs in the desired order. |  |

### Return type

**Array&lt;Integer&gt;**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_app

> <Schema> create_app(authorization, schema)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
schema = OneLogin::Schema.new # Schema | 

begin
  
  result = api_instance.create_app(authorization, schema)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_app: #{e}"
end
```

#### Using the create_app_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Schema>, Integer, Hash)> create_app_with_http_info(authorization, schema)

```ruby
begin
  
  data, status_code, headers = api_instance.create_app_with_http_info(authorization, schema)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Schema>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_app_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **schema** | [**Schema**](Schema.md) |  |  |

### Return type

[**Schema**](Schema.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_authorization_server

> <Id> create_authorization_server(authorization, create_authorization_server_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
create_authorization_server_request = OneLogin::CreateAuthorizationServerRequest.new # CreateAuthorizationServerRequest | 

begin
  
  result = api_instance.create_authorization_server(authorization, create_authorization_server_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_authorization_server: #{e}"
end
```

#### Using the create_authorization_server_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Id>, Integer, Hash)> create_authorization_server_with_http_info(authorization, create_authorization_server_request)

```ruby
begin
  
  data, status_code, headers = api_instance.create_authorization_server_with_http_info(authorization, create_authorization_server_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Id>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_authorization_server_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **create_authorization_server_request** | [**CreateAuthorizationServerRequest**](CreateAuthorizationServerRequest.md) |  |  |

### Return type

[**Id**](Id.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_environment_variable

> <Envvar> create_environment_variable(authorization, create_environment_variable_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
create_environment_variable_request = OneLogin::CreateEnvironmentVariableRequest.new({name: 'name_example', value: 'value_example'}) # CreateEnvironmentVariableRequest | 

begin
  
  result = api_instance.create_environment_variable(authorization, create_environment_variable_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_environment_variable: #{e}"
end
```

#### Using the create_environment_variable_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Envvar>, Integer, Hash)> create_environment_variable_with_http_info(authorization, create_environment_variable_request)

```ruby
begin
  
  data, status_code, headers = api_instance.create_environment_variable_with_http_info(authorization, create_environment_variable_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Envvar>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_environment_variable_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **create_environment_variable_request** | [**CreateEnvironmentVariableRequest**](CreateEnvironmentVariableRequest.md) |  |  |

### Return type

[**Envvar**](Envvar.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_hook

> create_hook(authorization, hook)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
hook = OneLogin::Hook.new({type: 'type_example', disabled: false, timeout: 37, env_vars: ['env_vars_example'], runtime: 'runtime_example', retries: 37, packages: 3.56, function: 'function_example'}) # Hook | 

begin
  
  api_instance.create_hook(authorization, hook)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_hook: #{e}"
end
```

#### Using the create_hook_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_hook_with_http_info(authorization, hook)

```ruby
begin
  
  data, status_code, headers = api_instance.create_hook_with_http_info(authorization, hook)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_hook_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **hook** | [**Hook**](Hook.md) |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## create_mapping

> Integer create_mapping(authorization, mapping)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
mapping = OneLogin::Mapping.new({name: 'name_example', enabled: false, match: 'all', position: 37, actions: [OneLogin::Action.new]}) # Mapping | 

begin
  
  result = api_instance.create_mapping(authorization, mapping)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_mapping: #{e}"
end
```

#### Using the create_mapping_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Integer, Integer, Hash)> create_mapping_with_http_info(authorization, mapping)

```ruby
begin
  
  data, status_code, headers = api_instance.create_mapping_with_http_info(authorization, mapping)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Integer
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_mapping_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **mapping** | [**Mapping**](Mapping.md) |  |  |

### Return type

**Integer**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_risk_rule

> create_risk_rule(authorization, risk_rule)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
risk_rule = OneLogin::RiskRule.new # RiskRule | 

begin
  
  api_instance.create_risk_rule(authorization, risk_rule)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_risk_rule: #{e}"
end
```

#### Using the create_risk_rule_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> create_risk_rule_with_http_info(authorization, risk_rule)

```ruby
begin
  
  data, status_code, headers = api_instance.create_risk_rule_with_http_info(authorization, risk_rule)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_risk_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **risk_rule** | [**RiskRule**](RiskRule.md) |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## create_roles

> <Array<CreateRoles201ResponseInner>> create_roles(authorization)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 

begin
  
  result = api_instance.create_roles(authorization)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_roles: #{e}"
end
```

#### Using the create_roles_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<CreateRoles201ResponseInner>>, Integer, Hash)> create_roles_with_http_info(authorization)

```ruby
begin
  
  data, status_code, headers = api_instance.create_roles_with_http_info(authorization)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<CreateRoles201ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_roles_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |

### Return type

[**Array&lt;CreateRoles201ResponseInner&gt;**](CreateRoles201ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## create_rule

> <RuleId> create_rule(authorization, app_id, rule)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
rule = OneLogin::Rule.new # Rule | 

begin
  
  result = api_instance.create_rule(authorization, app_id, rule)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_rule: #{e}"
end
```

#### Using the create_rule_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RuleId>, Integer, Hash)> create_rule_with_http_info(authorization, app_id, rule)

```ruby
begin
  
  data, status_code, headers = api_instance.create_rule_with_http_info(authorization, app_id, rule)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RuleId>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **rule** | [**Rule**](Rule.md) |  |  |

### Return type

[**RuleId**](RuleId.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## create_user

> <User> create_user(authorization, user, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user = OneLogin::User.new # User | 
opts = {
  mappings: 'async', # String | Controls how mappings will be applied to the user on creation. Defaults to async.
  validate_policy: true # Boolean | Will passwords validate against the User Policy? Defaults to true.
}

begin
  
  result = api_instance.create_user(authorization, user, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_user: #{e}"
end
```

#### Using the create_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<User>, Integer, Hash)> create_user_with_http_info(authorization, user, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.create_user_with_http_info(authorization, user, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <User>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->create_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user** | [**User**](User.md) |  |  |
| **mappings** | **String** | Controls how mappings will be applied to the user on creation. Defaults to async. | [optional] |
| **validate_policy** | **Boolean** | Will passwords validate against the User Policy? Defaults to true. | [optional] |

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## delete_access_token_claim

> delete_access_token_claim(authorization, id, claim_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 
claim_id = 56 # Integer | 

begin
  
  api_instance.delete_access_token_claim(authorization, id, claim_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_access_token_claim: #{e}"
end
```

#### Using the delete_access_token_claim_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_access_token_claim_with_http_info(authorization, id, claim_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_access_token_claim_with_http_info(authorization, id, claim_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_access_token_claim_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |
| **claim_id** | **Integer** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_app

> delete_app(authorization, app_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 

begin
  
  api_instance.delete_app(authorization, app_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_app: #{e}"
end
```

#### Using the delete_app_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_app_with_http_info(authorization, app_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_app_with_http_info(authorization, app_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_app_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_app_parameter

> delete_app_parameter(authorization, app_id, parameter_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
parameter_id = 56 # Integer | 

begin
  
  api_instance.delete_app_parameter(authorization, app_id, parameter_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_app_parameter: #{e}"
end
```

#### Using the delete_app_parameter_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_app_parameter_with_http_info(authorization, app_id, parameter_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_app_parameter_with_http_info(authorization, app_id, parameter_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_app_parameter_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **parameter_id** | **Integer** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_authorization_server

> delete_authorization_server(authorization, id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 

begin
  
  api_instance.delete_authorization_server(authorization, id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_authorization_server: #{e}"
end
```

#### Using the delete_authorization_server_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_authorization_server_with_http_info(authorization, id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_authorization_server_with_http_info(authorization, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_authorization_server_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_environment_variable

> delete_environment_variable(authorization, envvar_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
envvar_id = 'envvar_id_example' # String | Set to the id of the Hook Environment Variable that you want to fetch.

begin
  
  api_instance.delete_environment_variable(authorization, envvar_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_environment_variable: #{e}"
end
```

#### Using the delete_environment_variable_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_environment_variable_with_http_info(authorization, envvar_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_environment_variable_with_http_info(authorization, envvar_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_environment_variable_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **envvar_id** | **String** | Set to the id of the Hook Environment Variable that you want to fetch. |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_factor

> delete_factor(authorization, user_id, device_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user.
device_id = 56 # Integer | Set to the device_id of the MFA device.

begin
  
  api_instance.delete_factor(authorization, user_id, device_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_factor: #{e}"
end
```

#### Using the delete_factor_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_factor_with_http_info(authorization, user_id, device_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_factor_with_http_info(authorization, user_id, device_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_factor_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user. |  |
| **device_id** | **Integer** | Set to the device_id of the MFA device. |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## delete_hook

> delete_hook(authorization, hook_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
hook_id = 'hook_id_example' # String | Set to the id of the Hook that you want to return.

begin
  
  api_instance.delete_hook(authorization, hook_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_hook: #{e}"
end
```

#### Using the delete_hook_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_hook_with_http_info(authorization, hook_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_hook_with_http_info(authorization, hook_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_hook_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **hook_id** | **String** | Set to the id of the Hook that you want to return. |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_mapping

> delete_mapping(authorization, mapping_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
mapping_id = 56 # Integer | The id of the user mapping to locate.

begin
  
  api_instance.delete_mapping(authorization, mapping_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_mapping: #{e}"
end
```

#### Using the delete_mapping_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_mapping_with_http_info(authorization, mapping_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_mapping_with_http_info(authorization, mapping_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_mapping_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **mapping_id** | **Integer** | The id of the user mapping to locate. |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_risk_rule

> <RiskRule> delete_risk_rule(authorization, risk_rule_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
risk_rule_id = 'risk_rule_id_example' # String | 

begin
  
  result = api_instance.delete_risk_rule(authorization, risk_rule_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_risk_rule: #{e}"
end
```

#### Using the delete_risk_rule_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RiskRule>, Integer, Hash)> delete_risk_rule_with_http_info(authorization, risk_rule_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_risk_rule_with_http_info(authorization, risk_rule_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RiskRule>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_risk_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **risk_rule_id** | **String** |  |  |

### Return type

[**RiskRule**](RiskRule.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_role

> delete_role(authorization, role_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
role_id = 56 # Integer | Set to the id of the role you want to return.

begin
  
  api_instance.delete_role(authorization, role_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_role: #{e}"
end
```

#### Using the delete_role_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_role_with_http_info(authorization, role_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_role_with_http_info(authorization, role_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_role_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **role_id** | **Integer** | Set to the id of the role you want to return. |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_rule

> delete_rule(authorization, app_id, rule_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
rule_id = 56 # Integer | The id of the app rule to locate.

begin
  
  api_instance.delete_rule(authorization, app_id, rule_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_rule: #{e}"
end
```

#### Using the delete_rule_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_rule_with_http_info(authorization, app_id, rule_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_rule_with_http_info(authorization, app_id, rule_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **rule_id** | **Integer** | The id of the app rule to locate. |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_scope

> delete_scope(authorization, id, scope_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 
scope_id = 56 # Integer | 

begin
  
  api_instance.delete_scope(authorization, id, scope_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_scope: #{e}"
end
```

#### Using the delete_scope_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_scope_with_http_info(authorization, id, scope_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_scope_with_http_info(authorization, id, scope_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_scope_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |
| **scope_id** | **Integer** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## delete_user

> delete_user(authorization, user_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user that you want to return.

begin
  
  api_instance.delete_user(authorization, user_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_user: #{e}"
end
```

#### Using the delete_user_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> delete_user_with_http_info(authorization, user_id)

```ruby
begin
  
  data, status_code, headers = api_instance.delete_user_with_http_info(authorization, user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->delete_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user that you want to return. |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## dry_run_mapping

> Array&lt;Object&gt; dry_run_mapping(authorization, mapping_id, request_body)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
mapping_id = 56 # Integer | The id of the user mapping to locate.
request_body = [37] # Array<Integer> | Request body is a list of user IDs tested against the mapping conditions to verify that the mapping would be applied

begin
  
  result = api_instance.dry_run_mapping(authorization, mapping_id, request_body)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->dry_run_mapping: #{e}"
end
```

#### Using the dry_run_mapping_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Array&lt;Object&gt;, Integer, Hash)> dry_run_mapping_with_http_info(authorization, mapping_id, request_body)

```ruby
begin
  
  data, status_code, headers = api_instance.dry_run_mapping_with_http_info(authorization, mapping_id, request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Array&lt;Object&gt;
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->dry_run_mapping_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **mapping_id** | **Integer** | The id of the user mapping to locate. |  |
| **request_body** | [**Array&lt;Integer&gt;**](Integer.md) | Request body is a list of user IDs tested against the mapping conditions to verify that the mapping would be applied |  |

### Return type

**Array&lt;Object&gt;**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## enroll_factor

> Array&lt;Array&gt; enroll_factor(authorization, user_id, enroll_factor_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user.
enroll_factor_request = OneLogin::EnrollFactorRequest.new({factor_id: 37, display_name: 'display_name_example'}) # EnrollFactorRequest | 

begin
  
  result = api_instance.enroll_factor(authorization, user_id, enroll_factor_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->enroll_factor: #{e}"
end
```

#### Using the enroll_factor_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Array&lt;Array&gt;, Integer, Hash)> enroll_factor_with_http_info(authorization, user_id, enroll_factor_request)

```ruby
begin
  
  data, status_code, headers = api_instance.enroll_factor_with_http_info(authorization, user_id, enroll_factor_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Array&lt;Array&gt;
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->enroll_factor_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user. |  |
| **enroll_factor_request** | [**EnrollFactorRequest**](EnrollFactorRequest.md) |  |  |

### Return type

**Array&lt;Array&gt;**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## generate_mfa_token

> <GenerateMfaToken200Response> generate_mfa_token(authorization, generate_mfa_token_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
generate_mfa_token_request = OneLogin::GenerateMfaTokenRequest.new # GenerateMfaTokenRequest | 

begin
  
  result = api_instance.generate_mfa_token(authorization, generate_mfa_token_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->generate_mfa_token: #{e}"
end
```

#### Using the generate_mfa_token_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenerateMfaToken200Response>, Integer, Hash)> generate_mfa_token_with_http_info(authorization, generate_mfa_token_request)

```ruby
begin
  
  data, status_code, headers = api_instance.generate_mfa_token_with_http_info(authorization, generate_mfa_token_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenerateMfaToken200Response>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->generate_mfa_token_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **generate_mfa_token_request** | [**GenerateMfaTokenRequest**](GenerateMfaTokenRequest.md) |  |  |

### Return type

[**GenerateMfaToken200Response**](GenerateMfaToken200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## generate_saml_assertion

> generate_saml_assertion(authorization, generate_saml_assertion_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
generate_saml_assertion_request = OneLogin::GenerateSamlAssertionRequest.new({username_or_email: 'username_or_email_example', password: 'password_example', app_id: 'app_id_example', subdomain: 'subdomain_example'}) # GenerateSamlAssertionRequest | 

begin
  
  api_instance.generate_saml_assertion(authorization, generate_saml_assertion_request)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->generate_saml_assertion: #{e}"
end
```

#### Using the generate_saml_assertion_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> generate_saml_assertion_with_http_info(authorization, generate_saml_assertion_request)

```ruby
begin
  
  data, status_code, headers = api_instance.generate_saml_assertion_with_http_info(authorization, generate_saml_assertion_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->generate_saml_assertion_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **generate_saml_assertion_request** | [**GenerateSamlAssertionRequest**](GenerateSamlAssertionRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## generate_token

> <GenerateToken200Response> generate_token(authorization, generate_token_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
generate_token_request = OneLogin::GenerateTokenRequest.new # GenerateTokenRequest | 

begin
  
  result = api_instance.generate_token(authorization, generate_token_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->generate_token: #{e}"
end
```

#### Using the generate_token_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenerateToken200Response>, Integer, Hash)> generate_token_with_http_info(authorization, generate_token_request)

```ruby
begin
  
  data, status_code, headers = api_instance.generate_token_with_http_info(authorization, generate_token_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenerateToken200Response>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->generate_token_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **generate_token_request** | [**GenerateTokenRequest**](GenerateTokenRequest.md) |  |  |

### Return type

[**GenerateToken200Response**](GenerateToken200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_app

> <Schema> get_app(authorization, app_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 

begin
  
  result = api_instance.get_app(authorization, app_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_app: #{e}"
end
```

#### Using the get_app_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Schema>, Integer, Hash)> get_app_with_http_info(authorization, app_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_app_with_http_info(authorization, app_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Schema>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_app_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |

### Return type

[**Schema**](Schema.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_authorization_server

> <GetAuthorizationServer200Response> get_authorization_server(authorization, id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 

begin
  
  result = api_instance.get_authorization_server(authorization, id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_authorization_server: #{e}"
end
```

#### Using the get_authorization_server_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetAuthorizationServer200Response>, Integer, Hash)> get_authorization_server_with_http_info(authorization, id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_authorization_server_with_http_info(authorization, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetAuthorizationServer200Response>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_authorization_server_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |

### Return type

[**GetAuthorizationServer200Response**](GetAuthorizationServer200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_available_factors

> <Array<GetAvailableFactors200ResponseInner>> get_available_factors(authorization, user_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user.

begin
  
  result = api_instance.get_available_factors(authorization, user_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_available_factors: #{e}"
end
```

#### Using the get_available_factors_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<GetAvailableFactors200ResponseInner>>, Integer, Hash)> get_available_factors_with_http_info(authorization, user_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_available_factors_with_http_info(authorization, user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<GetAvailableFactors200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_available_factors_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user. |  |

### Return type

[**Array&lt;GetAvailableFactors200ResponseInner&gt;**](GetAvailableFactors200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_client_apps

> <Array<GetClientApps200ResponseInner>> get_client_apps(authorization, id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 

begin
  
  result = api_instance.get_client_apps(authorization, id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_client_apps: #{e}"
end
```

#### Using the get_client_apps_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<GetClientApps200ResponseInner>>, Integer, Hash)> get_client_apps_with_http_info(authorization, id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_client_apps_with_http_info(authorization, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<GetClientApps200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_client_apps_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |

### Return type

[**Array&lt;GetClientApps200ResponseInner&gt;**](GetClientApps200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_enrolled_factors

> <Array<Device>> get_enrolled_factors(authorization, user_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user.

begin
  
  result = api_instance.get_enrolled_factors(authorization, user_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_enrolled_factors: #{e}"
end
```

#### Using the get_enrolled_factors_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Device>>, Integer, Hash)> get_enrolled_factors_with_http_info(authorization, user_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_enrolled_factors_with_http_info(authorization, user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Device>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_enrolled_factors_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user. |  |

### Return type

[**Array&lt;Device&gt;**](Device.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_environment_variable

> <Envvar> get_environment_variable(authorization, envvar_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
envvar_id = 'envvar_id_example' # String | Set to the id of the Hook Environment Variable that you want to fetch.

begin
  
  result = api_instance.get_environment_variable(authorization, envvar_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_environment_variable: #{e}"
end
```

#### Using the get_environment_variable_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Envvar>, Integer, Hash)> get_environment_variable_with_http_info(authorization, envvar_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_environment_variable_with_http_info(authorization, envvar_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Envvar>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_environment_variable_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **envvar_id** | **String** | Set to the id of the Hook Environment Variable that you want to fetch. |  |

### Return type

[**Envvar**](Envvar.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_hook

> <Hook> get_hook(authorization, hook_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
hook_id = 'hook_id_example' # String | Set to the id of the Hook that you want to return.

begin
  
  result = api_instance.get_hook(authorization, hook_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_hook: #{e}"
end
```

#### Using the get_hook_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Hook>, Integer, Hash)> get_hook_with_http_info(authorization, hook_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_hook_with_http_info(authorization, hook_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Hook>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_hook_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **hook_id** | **String** | Set to the id of the Hook that you want to return. |  |

### Return type

[**Hook**](Hook.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_logs

> <Array<Log>> get_logs(authorization, hook_id, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
hook_id = 'hook_id_example' # String | Set to the id of the Hook that you want to return.
opts = {
  limit: 56, # Integer | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit.
  page: 56, # Integer | The page number of results to return.
  cursor: 'cursor_example', # String | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page.
  request_id: 'request_id_example', # String | Returns logs that contain this request_id.
  correlation_id: 'correlation_id_example' # String | Returns logs that contain this correlation_id.
}

begin
  
  result = api_instance.get_logs(authorization, hook_id, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_logs: #{e}"
end
```

#### Using the get_logs_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Log>>, Integer, Hash)> get_logs_with_http_info(authorization, hook_id, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_logs_with_http_info(authorization, hook_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Log>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_logs_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **hook_id** | **String** | Set to the id of the Hook that you want to return. |  |
| **limit** | **Integer** | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit. | [optional] |
| **page** | **Integer** | The page number of results to return. | [optional] |
| **cursor** | **String** | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page. | [optional] |
| **request_id** | **String** | Returns logs that contain this request_id. | [optional] |
| **correlation_id** | **String** | Returns logs that contain this correlation_id. | [optional] |

### Return type

[**Array&lt;Log&gt;**](Log.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_mapping

> <Mapping> get_mapping(authorization, mapping_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
mapping_id = 56 # Integer | The id of the user mapping to locate.

begin
  
  result = api_instance.get_mapping(authorization, mapping_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_mapping: #{e}"
end
```

#### Using the get_mapping_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Mapping>, Integer, Hash)> get_mapping_with_http_info(authorization, mapping_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_mapping_with_http_info(authorization, mapping_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Mapping>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_mapping_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **mapping_id** | **Integer** | The id of the user mapping to locate. |  |

### Return type

[**Mapping**](Mapping.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_rate_limit

> <GetRateLimit200Response> get_rate_limit(authorization)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 

begin
  
  result = api_instance.get_rate_limit(authorization)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_rate_limit: #{e}"
end
```

#### Using the get_rate_limit_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetRateLimit200Response>, Integer, Hash)> get_rate_limit_with_http_info(authorization)

```ruby
begin
  
  data, status_code, headers = api_instance.get_rate_limit_with_http_info(authorization)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetRateLimit200Response>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_rate_limit_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |

### Return type

[**GetRateLimit200Response**](GetRateLimit200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_risk_rule

> get_risk_rule(authorization, risk_rule_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
risk_rule_id = 'risk_rule_id_example' # String | 

begin
  
  api_instance.get_risk_rule(authorization, risk_rule_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_risk_rule: #{e}"
end
```

#### Using the get_risk_rule_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> get_risk_rule_with_http_info(authorization, risk_rule_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_risk_rule_with_http_info(authorization, risk_rule_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_risk_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **risk_rule_id** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## get_risk_score

> <GetRiskScore200Response> get_risk_score(authorization, get_risk_score_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
get_risk_score_request = OneLogin::GetRiskScoreRequest.new({ip: 'ip_example', user_agent: 'user_agent_example', user: OneLogin::RiskUser.new({id: 'id_example'})}) # GetRiskScoreRequest | 

begin
  
  result = api_instance.get_risk_score(authorization, get_risk_score_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_risk_score: #{e}"
end
```

#### Using the get_risk_score_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetRiskScore200Response>, Integer, Hash)> get_risk_score_with_http_info(authorization, get_risk_score_request)

```ruby
begin
  
  data, status_code, headers = api_instance.get_risk_score_with_http_info(authorization, get_risk_score_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetRiskScore200Response>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_risk_score_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **get_risk_score_request** | [**GetRiskScoreRequest**](GetRiskScoreRequest.md) |  |  |

### Return type

[**GetRiskScore200Response**](GetRiskScore200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## get_role

> <Role> get_role(authorization, role_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
role_id = 56 # Integer | Set to the id of the role you want to return.

begin
  
  result = api_instance.get_role(authorization, role_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_role: #{e}"
end
```

#### Using the get_role_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Role>, Integer, Hash)> get_role_with_http_info(authorization, role_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_role_with_http_info(authorization, role_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Role>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_role_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **role_id** | **Integer** | Set to the id of the role you want to return. |  |

### Return type

[**Role**](Role.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_role_admins

> <Array<Schema1>> get_role_admins(authorization, role_id, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
role_id = 56 # Integer | Set to the id of the role you want to return.
opts = {
  limit: 56, # Integer | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit.
  page: 56, # Integer | The page number of results to return.
  cursor: 'cursor_example', # String | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page.
  name: 'name_example', # String | Allows you to filter on first name, last name, username, and email address.
  include_unassigned: true # Boolean | Optional. Defaults to false. Include users that aren’t assigned to the role.
}

begin
  
  result = api_instance.get_role_admins(authorization, role_id, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_role_admins: #{e}"
end
```

#### Using the get_role_admins_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Schema1>>, Integer, Hash)> get_role_admins_with_http_info(authorization, role_id, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_role_admins_with_http_info(authorization, role_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Schema1>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_role_admins_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **role_id** | **Integer** | Set to the id of the role you want to return. |  |
| **limit** | **Integer** | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit. | [optional] |
| **page** | **Integer** | The page number of results to return. | [optional] |
| **cursor** | **String** | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page. | [optional] |
| **name** | **String** | Allows you to filter on first name, last name, username, and email address. | [optional] |
| **include_unassigned** | **Boolean** | Optional. Defaults to false. Include users that aren’t assigned to the role. | [optional] |

### Return type

[**Array&lt;Schema1&gt;**](Schema1.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: applcation/json, application/json


## get_role_apps

> <Array<Schema>> get_role_apps(authorization, role_id, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
role_id = 56 # Integer | Set to the id of the role you want to return.
opts = {
  limit: 56, # Integer | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit.
  page: 56, # Integer | The page number of results to return.
  cursor: 'cursor_example', # String | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page.
  assigned: true # Boolean | Optional. Defaults to true. Returns all apps not yet assigned to the role.
}

begin
  
  result = api_instance.get_role_apps(authorization, role_id, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_role_apps: #{e}"
end
```

#### Using the get_role_apps_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Schema>>, Integer, Hash)> get_role_apps_with_http_info(authorization, role_id, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_role_apps_with_http_info(authorization, role_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Schema>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_role_apps_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **role_id** | **Integer** | Set to the id of the role you want to return. |  |
| **limit** | **Integer** | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit. | [optional] |
| **page** | **Integer** | The page number of results to return. | [optional] |
| **cursor** | **String** | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page. | [optional] |
| **assigned** | **Boolean** | Optional. Defaults to true. Returns all apps not yet assigned to the role. | [optional] |

### Return type

[**Array&lt;Schema&gt;**](Schema.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: applcation/json, application/json


## get_role_users

> <Array<Schema1>> get_role_users(authorization, role_id, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
role_id = 56 # Integer | Set to the id of the role you want to return.
opts = {
  limit: 56, # Integer | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit.
  page: 56, # Integer | The page number of results to return.
  cursor: 'cursor_example', # String | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page.
  name: 'name_example', # String | Allows you to filter on first name, last name, username, and email address.
  include_unassigned: true # Boolean | Optional. Defaults to false. Include users that aren’t assigned to the role.
}

begin
  
  result = api_instance.get_role_users(authorization, role_id, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_role_users: #{e}"
end
```

#### Using the get_role_users_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Schema1>>, Integer, Hash)> get_role_users_with_http_info(authorization, role_id, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_role_users_with_http_info(authorization, role_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Schema1>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_role_users_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **role_id** | **Integer** | Set to the id of the role you want to return. |  |
| **limit** | **Integer** | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit. | [optional] |
| **page** | **Integer** | The page number of results to return. | [optional] |
| **cursor** | **String** | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page. | [optional] |
| **name** | **String** | Allows you to filter on first name, last name, username, and email address. | [optional] |
| **include_unassigned** | **Boolean** | Optional. Defaults to false. Include users that aren’t assigned to the role. | [optional] |

### Return type

[**Array&lt;Schema1&gt;**](Schema1.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: applcation/json, application/json


## get_rule

> <Rule> get_rule(authorization, app_id, rule_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
rule_id = 56 # Integer | The id of the app rule to locate.

begin
  
  result = api_instance.get_rule(authorization, app_id, rule_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_rule: #{e}"
end
```

#### Using the get_rule_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Rule>, Integer, Hash)> get_rule_with_http_info(authorization, app_id, rule_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_rule_with_http_info(authorization, app_id, rule_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Rule>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **rule_id** | **Integer** | The id of the app rule to locate. |  |

### Return type

[**Rule**](Rule.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_score_insights

> <GetScoreInsights200Response> get_score_insights(authorization, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
opts = {
  before: 'before_example', # String | Optional ISO8601 formatted date string. Defaults to current date. Maximum date is 90 days ago.
  after: 'after_example' # String | Optional ISO8601 formatted date string. Defaults to 30 days ago. Maximum date is 90 days ago.
}

begin
  
  result = api_instance.get_score_insights(authorization, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_score_insights: #{e}"
end
```

#### Using the get_score_insights_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetScoreInsights200Response>, Integer, Hash)> get_score_insights_with_http_info(authorization, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_score_insights_with_http_info(authorization, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetScoreInsights200Response>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_score_insights_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **before** | **String** | Optional ISO8601 formatted date string. Defaults to current date. Maximum date is 90 days ago. | [optional] |
| **after** | **String** | Optional ISO8601 formatted date string. Defaults to 30 days ago. Maximum date is 90 days ago. | [optional] |

### Return type

[**GetScoreInsights200Response**](GetScoreInsights200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_user

> <User> get_user(authorization, user_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user that you want to return.

begin
  
  result = api_instance.get_user(authorization, user_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_user: #{e}"
end
```

#### Using the get_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<User>, Integer, Hash)> get_user_with_http_info(authorization, user_id)

```ruby
begin
  
  data, status_code, headers = api_instance.get_user_with_http_info(authorization, user_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <User>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user that you want to return. |  |

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get_user_apps

> <Array<GetUserApps200ResponseInner>> get_user_apps(authorization, user_id, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user that you want to return.
opts = {
  ignore_visibility: true # Boolean | Defaults to `false`. When `true` will show all apps that are assigned to a user regardless of their portal visibility setting.
}

begin
  
  result = api_instance.get_user_apps(authorization, user_id, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_user_apps: #{e}"
end
```

#### Using the get_user_apps_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<GetUserApps200ResponseInner>>, Integer, Hash)> get_user_apps_with_http_info(authorization, user_id, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.get_user_apps_with_http_info(authorization, user_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<GetUserApps200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->get_user_apps_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user that you want to return. |  |
| **ignore_visibility** | **Boolean** | Defaults to &#x60;false&#x60;. When &#x60;true&#x60; will show all apps that are assigned to a user regardless of their portal visibility setting. | [optional] |

### Return type

[**Array&lt;GetUserApps200ResponseInner&gt;**](GetUserApps200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_access_token_claims

> <Array<ListAccessTokenClaims200ResponseInner>> list_access_token_claims(authorization, id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 

begin
  
  result = api_instance.list_access_token_claims(authorization, id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_access_token_claims: #{e}"
end
```

#### Using the list_access_token_claims_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListAccessTokenClaims200ResponseInner>>, Integer, Hash)> list_access_token_claims_with_http_info(authorization, id)

```ruby
begin
  
  data, status_code, headers = api_instance.list_access_token_claims_with_http_info(authorization, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListAccessTokenClaims200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_access_token_claims_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |

### Return type

[**Array&lt;ListAccessTokenClaims200ResponseInner&gt;**](ListAccessTokenClaims200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_action_values

> <Array<ListConditionValues200ResponseInner>> list_action_values(authorization, app_id, action_value)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
action_value = 'action_value_example' # String | The value for the selected action.

begin
  
  result = api_instance.list_action_values(authorization, app_id, action_value)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_action_values: #{e}"
end
```

#### Using the list_action_values_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListConditionValues200ResponseInner>>, Integer, Hash)> list_action_values_with_http_info(authorization, app_id, action_value)

```ruby
begin
  
  data, status_code, headers = api_instance.list_action_values_with_http_info(authorization, app_id, action_value)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListConditionValues200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_action_values_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **action_value** | **String** | The value for the selected action. |  |

### Return type

[**Array&lt;ListConditionValues200ResponseInner&gt;**](ListConditionValues200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_actions

> <Array<ListActions200ResponseInner>> list_actions(authorization, app_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 

begin
  
  result = api_instance.list_actions(authorization, app_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_actions: #{e}"
end
```

#### Using the list_actions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListActions200ResponseInner>>, Integer, Hash)> list_actions_with_http_info(authorization, app_id)

```ruby
begin
  
  data, status_code, headers = api_instance.list_actions_with_http_info(authorization, app_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListActions200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_actions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |

### Return type

[**Array&lt;ListActions200ResponseInner&gt;**](ListActions200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_app_users

> <Array<ListAppUsers200ResponseInner>> list_app_users(authorization, app_id, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
opts = {
  limit: 56, # Integer | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit.
  page: 56, # Integer | The page number of results to return.
  cursor: 'cursor_example' # String | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page.
}

begin
  
  result = api_instance.list_app_users(authorization, app_id, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_app_users: #{e}"
end
```

#### Using the list_app_users_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListAppUsers200ResponseInner>>, Integer, Hash)> list_app_users_with_http_info(authorization, app_id, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.list_app_users_with_http_info(authorization, app_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListAppUsers200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_app_users_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **limit** | **Integer** | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit. | [optional] |
| **page** | **Integer** | The page number of results to return. | [optional] |
| **cursor** | **String** | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page. | [optional] |

### Return type

[**Array&lt;ListAppUsers200ResponseInner&gt;**](ListAppUsers200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_apps

> <Array<Schema>> list_apps(authorization, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
opts = {
  limit: 56, # Integer | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit.
  page: 56, # Integer | The page number of results to return.
  cursor: 'cursor_example', # String | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page.
  name: 'name_example', # String | The name or partial name of the app to search for. When using a partial name you must append a wildcard `*`
  connector_id: 56, # Integer | Returns all apps based off a specific connector. See List Connectors for a complete list of Connector IDs.
  auth_method: OneLogin::AuthMethod::N0 # AuthMethod | Returns all apps based of a given type.
}

begin
  
  result = api_instance.list_apps(authorization, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_apps: #{e}"
end
```

#### Using the list_apps_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Schema>>, Integer, Hash)> list_apps_with_http_info(authorization, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.list_apps_with_http_info(authorization, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Schema>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_apps_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **limit** | **Integer** | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit. | [optional] |
| **page** | **Integer** | The page number of results to return. | [optional] |
| **cursor** | **String** | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page. | [optional] |
| **name** | **String** | The name or partial name of the app to search for. When using a partial name you must append a wildcard &#x60;*&#x60; | [optional] |
| **connector_id** | **Integer** | Returns all apps based off a specific connector. See List Connectors for a complete list of Connector IDs. | [optional] |
| **auth_method** | [**AuthMethod**](.md) | Returns all apps based of a given type. | [optional] |

### Return type

[**Array&lt;Schema&gt;**](Schema.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_authorization_servers

> <Array<ListAuthorizationServers200ResponseInner>> list_authorization_servers(authorization)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 

begin
  
  result = api_instance.list_authorization_servers(authorization)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_authorization_servers: #{e}"
end
```

#### Using the list_authorization_servers_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListAuthorizationServers200ResponseInner>>, Integer, Hash)> list_authorization_servers_with_http_info(authorization)

```ruby
begin
  
  data, status_code, headers = api_instance.list_authorization_servers_with_http_info(authorization)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListAuthorizationServers200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_authorization_servers_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |

### Return type

[**Array&lt;ListAuthorizationServers200ResponseInner&gt;**](ListAuthorizationServers200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_condition_operators

> <Array<ListConditionOperators200ResponseInner>> list_condition_operators(authorization, app_id, condition_value)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
condition_value = 'condition_value_example' # String | The value for the selected condition.

begin
  
  result = api_instance.list_condition_operators(authorization, app_id, condition_value)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_condition_operators: #{e}"
end
```

#### Using the list_condition_operators_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListConditionOperators200ResponseInner>>, Integer, Hash)> list_condition_operators_with_http_info(authorization, app_id, condition_value)

```ruby
begin
  
  data, status_code, headers = api_instance.list_condition_operators_with_http_info(authorization, app_id, condition_value)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListConditionOperators200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_condition_operators_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **condition_value** | **String** | The value for the selected condition. |  |

### Return type

[**Array&lt;ListConditionOperators200ResponseInner&gt;**](ListConditionOperators200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_condition_values

> <Array<ListConditionValues200ResponseInner>> list_condition_values(authorization, app_id, condition_value)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
condition_value = 'condition_value_example' # String | The value for the selected condition.

begin
  
  result = api_instance.list_condition_values(authorization, app_id, condition_value)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_condition_values: #{e}"
end
```

#### Using the list_condition_values_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListConditionValues200ResponseInner>>, Integer, Hash)> list_condition_values_with_http_info(authorization, app_id, condition_value)

```ruby
begin
  
  data, status_code, headers = api_instance.list_condition_values_with_http_info(authorization, app_id, condition_value)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListConditionValues200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_condition_values_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **condition_value** | **String** | The value for the selected condition. |  |

### Return type

[**Array&lt;ListConditionValues200ResponseInner&gt;**](ListConditionValues200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_conditions

> <Array<ListConditions200ResponseInner>> list_conditions(authorization, app_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 

begin
  
  result = api_instance.list_conditions(authorization, app_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_conditions: #{e}"
end
```

#### Using the list_conditions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListConditions200ResponseInner>>, Integer, Hash)> list_conditions_with_http_info(authorization, app_id)

```ruby
begin
  
  data, status_code, headers = api_instance.list_conditions_with_http_info(authorization, app_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListConditions200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_conditions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |

### Return type

[**Array&lt;ListConditions200ResponseInner&gt;**](ListConditions200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_connectors

> <Array<Connector>> list_connectors(authorization, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
opts = {
  limit: 56, # Integer | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit.
  page: 56, # Integer | The page number of results to return.
  cursor: 'cursor_example', # String | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page.
  name: 'name_example', # String | The name or partial name of the connector to search for. When using a partial name you must append a wildcard `*`
  auth_method: OneLogin::AuthMethod::N0 # AuthMethod | Returns all connectors of a given type.
}

begin
  
  result = api_instance.list_connectors(authorization, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_connectors: #{e}"
end
```

#### Using the list_connectors_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Connector>>, Integer, Hash)> list_connectors_with_http_info(authorization, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.list_connectors_with_http_info(authorization, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Connector>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_connectors_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **limit** | **Integer** | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit. | [optional] |
| **page** | **Integer** | The page number of results to return. | [optional] |
| **cursor** | **String** | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page. | [optional] |
| **name** | **String** | The name or partial name of the connector to search for. When using a partial name you must append a wildcard &#x60;*&#x60; | [optional] |
| **auth_method** | [**AuthMethod**](.md) | Returns all connectors of a given type. | [optional] |

### Return type

[**Array&lt;Connector&gt;**](Connector.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_environment_variables

> <Array<Envvar>> list_environment_variables(authorization, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
opts = {
  limit: 56, # Integer | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit.
  page: 56, # Integer | The page number of results to return.
  cursor: 'cursor_example' # String | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page.
}

begin
  
  result = api_instance.list_environment_variables(authorization, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_environment_variables: #{e}"
end
```

#### Using the list_environment_variables_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Envvar>>, Integer, Hash)> list_environment_variables_with_http_info(authorization, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.list_environment_variables_with_http_info(authorization, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Envvar>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_environment_variables_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **limit** | **Integer** | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit. | [optional] |
| **page** | **Integer** | The page number of results to return. | [optional] |
| **cursor** | **String** | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page. | [optional] |

### Return type

[**Array&lt;Envvar&gt;**](Envvar.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_hooks

> <Array<Hook>> list_hooks(authorization, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
opts = {
  limit: 56, # Integer | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit.
  page: 56, # Integer | The page number of results to return.
  cursor: 'cursor_example' # String | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page.
}

begin
  
  result = api_instance.list_hooks(authorization, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_hooks: #{e}"
end
```

#### Using the list_hooks_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Hook>>, Integer, Hash)> list_hooks_with_http_info(authorization, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.list_hooks_with_http_info(authorization, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Hook>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_hooks_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **limit** | **Integer** | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit. | [optional] |
| **page** | **Integer** | The page number of results to return. | [optional] |
| **cursor** | **String** | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page. | [optional] |

### Return type

[**Array&lt;Hook&gt;**](Hook.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_mapping_action_values

> <Array<ListConditionValues200ResponseInner>> list_mapping_action_values(authorization, action_value)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
action_value = 'action_value_example' # String | The value for the selected action.

begin
  
  result = api_instance.list_mapping_action_values(authorization, action_value)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mapping_action_values: #{e}"
end
```

#### Using the list_mapping_action_values_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListConditionValues200ResponseInner>>, Integer, Hash)> list_mapping_action_values_with_http_info(authorization, action_value)

```ruby
begin
  
  data, status_code, headers = api_instance.list_mapping_action_values_with_http_info(authorization, action_value)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListConditionValues200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mapping_action_values_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **action_value** | **String** | The value for the selected action. |  |

### Return type

[**Array&lt;ListConditionValues200ResponseInner&gt;**](ListConditionValues200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_mapping_actions

> <Array<ListActions200ResponseInner>> list_mapping_actions(authorization)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 

begin
  
  result = api_instance.list_mapping_actions(authorization)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mapping_actions: #{e}"
end
```

#### Using the list_mapping_actions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListActions200ResponseInner>>, Integer, Hash)> list_mapping_actions_with_http_info(authorization)

```ruby
begin
  
  data, status_code, headers = api_instance.list_mapping_actions_with_http_info(authorization)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListActions200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mapping_actions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |

### Return type

[**Array&lt;ListActions200ResponseInner&gt;**](ListActions200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_mapping_condition_operators

> <Array<ListMappingConditionOperators200ResponseInner>> list_mapping_condition_operators(authorization, condition_value)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
condition_value = 'condition_value_example' # String | The value for the selected condition.

begin
  
  result = api_instance.list_mapping_condition_operators(authorization, condition_value)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mapping_condition_operators: #{e}"
end
```

#### Using the list_mapping_condition_operators_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListMappingConditionOperators200ResponseInner>>, Integer, Hash)> list_mapping_condition_operators_with_http_info(authorization, condition_value)

```ruby
begin
  
  data, status_code, headers = api_instance.list_mapping_condition_operators_with_http_info(authorization, condition_value)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListMappingConditionOperators200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mapping_condition_operators_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **condition_value** | **String** | The value for the selected condition. |  |

### Return type

[**Array&lt;ListMappingConditionOperators200ResponseInner&gt;**](ListMappingConditionOperators200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_mapping_condition_values

> <Array<ListConditionValues200ResponseInner>> list_mapping_condition_values(authorization, condition_value)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
condition_value = 'condition_value_example' # String | The value for the selected condition.

begin
  
  result = api_instance.list_mapping_condition_values(authorization, condition_value)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mapping_condition_values: #{e}"
end
```

#### Using the list_mapping_condition_values_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListConditionValues200ResponseInner>>, Integer, Hash)> list_mapping_condition_values_with_http_info(authorization, condition_value)

```ruby
begin
  
  data, status_code, headers = api_instance.list_mapping_condition_values_with_http_info(authorization, condition_value)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListConditionValues200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mapping_condition_values_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **condition_value** | **String** | The value for the selected condition. |  |

### Return type

[**Array&lt;ListConditionValues200ResponseInner&gt;**](ListConditionValues200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_mapping_conditions

> <Array<ListMappingConditions200ResponseInner>> list_mapping_conditions(authorization)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 

begin
  
  result = api_instance.list_mapping_conditions(authorization)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mapping_conditions: #{e}"
end
```

#### Using the list_mapping_conditions_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListMappingConditions200ResponseInner>>, Integer, Hash)> list_mapping_conditions_with_http_info(authorization)

```ruby
begin
  
  data, status_code, headers = api_instance.list_mapping_conditions_with_http_info(authorization)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListMappingConditions200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mapping_conditions_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |

### Return type

[**Array&lt;ListMappingConditions200ResponseInner&gt;**](ListMappingConditions200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_mappings

> <Array<Mapping>> list_mappings(authorization, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
opts = {
  enabled: true, # Boolean | Defaults to true. When set to `false` will return all disabled mappings.
  has_condition: 'has_condition=has_role:123456,status:1', # String | Filters Mappings based on their Conditions.
  has_condition_type: 'builtin', # String | Filters Mappings based on their condition types.
  has_action: 'has_action=set_groups:123456,set_usertype:*', # String | Filters Mappings based on their Actions.
  has_action_type: 'builtin' # String | Filters Mappings based on their action types.
}

begin
  
  result = api_instance.list_mappings(authorization, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mappings: #{e}"
end
```

#### Using the list_mappings_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Mapping>>, Integer, Hash)> list_mappings_with_http_info(authorization, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.list_mappings_with_http_info(authorization, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Mapping>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_mappings_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **enabled** | **Boolean** | Defaults to true. When set to &#x60;false&#x60; will return all disabled mappings. | [optional][default to true] |
| **has_condition** | **String** | Filters Mappings based on their Conditions. | [optional] |
| **has_condition_type** | **String** | Filters Mappings based on their condition types. | [optional] |
| **has_action** | **String** | Filters Mappings based on their Actions. | [optional] |
| **has_action_type** | **String** | Filters Mappings based on their action types. | [optional] |

### Return type

[**Array&lt;Mapping&gt;**](Mapping.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_risk_rules

> list_risk_rules(authorization)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 

begin
  
  api_instance.list_risk_rules(authorization)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_risk_rules: #{e}"
end
```

#### Using the list_risk_rules_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> list_risk_rules_with_http_info(authorization)

```ruby
begin
  
  data, status_code, headers = api_instance.list_risk_rules_with_http_info(authorization)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_risk_rules_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


## list_roles

> <Array<Role>> list_roles(authorization, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
opts = {
  limit: 56, # Integer | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit.
  page: 56, # Integer | The page number of results to return.
  cursor: 'cursor_example', # String | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page.
  name: 'name_example', # String | Optional. Filters by role name.
  app_id: 'app_id_example', # String | Optional. Returns roles that contain this app name.
  fields: 'apps' # String | Optional. Comma delimited list of fields to return.
}

begin
  
  result = api_instance.list_roles(authorization, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_roles: #{e}"
end
```

#### Using the list_roles_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Role>>, Integer, Hash)> list_roles_with_http_info(authorization, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.list_roles_with_http_info(authorization, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Role>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_roles_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **limit** | **Integer** | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit. | [optional] |
| **page** | **Integer** | The page number of results to return. | [optional] |
| **cursor** | **String** | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page. | [optional] |
| **name** | **String** | Optional. Filters by role name. | [optional] |
| **app_id** | **String** | Optional. Returns roles that contain this app name. | [optional] |
| **fields** | **String** | Optional. Comma delimited list of fields to return. | [optional] |

### Return type

[**Array&lt;Role&gt;**](Role.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_rules

> <Array<Rule>> list_rules(authorization, app_id, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
opts = {
  enabled: true, # Boolean | Defaults to true. When set to `false` will return all disabled rules.
  has_condition: 'has_condition_example', # String | Filters Rules based on their Conditions.
  has_condition_type: 'has_condition_type_example', # String | Filters Rules based on their condition types.
  has_action: 'has_action_example', # String | Filters Rules based on their Actions.
  has_action_type: 'has_action_type_example' # String | Filters Rules based on their action types.
}

begin
  
  result = api_instance.list_rules(authorization, app_id, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_rules: #{e}"
end
```

#### Using the list_rules_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Rule>>, Integer, Hash)> list_rules_with_http_info(authorization, app_id, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.list_rules_with_http_info(authorization, app_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Rule>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_rules_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **enabled** | **Boolean** | Defaults to true. When set to &#x60;false&#x60; will return all disabled rules. | [optional] |
| **has_condition** | **String** | Filters Rules based on their Conditions. | [optional] |
| **has_condition_type** | **String** | Filters Rules based on their condition types. | [optional] |
| **has_action** | **String** | Filters Rules based on their Actions. | [optional] |
| **has_action_type** | **String** | Filters Rules based on their action types. | [optional] |

### Return type

[**Array&lt;Rule&gt;**](Rule.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_scopes

> <Array<ListScopes200ResponseInner>> list_scopes(authorization, id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 

begin
  
  result = api_instance.list_scopes(authorization, id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_scopes: #{e}"
end
```

#### Using the list_scopes_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<ListScopes200ResponseInner>>, Integer, Hash)> list_scopes_with_http_info(authorization, id)

```ruby
begin
  
  data, status_code, headers = api_instance.list_scopes_with_http_info(authorization, id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<ListScopes200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_scopes_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |

### Return type

[**Array&lt;ListScopes200ResponseInner&gt;**](ListScopes200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## list_users

> <Array<User>> list_users(authorization, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
opts = {
  limit: 56, # Integer | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit.
  page: 56, # Integer | The page number of results to return.
  cursor: 'cursor_example', # String | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page.
  created_since: 'created_since_example', # String | An ISO8601 timestamp value that returns all users created after a given date & time.
  created_until: 'created_until_example', # String | An ISO8601 timestamp value that returns all users created before a given date & time.
  updated_since: 'updated_since_example', # String | An ISO8601 timestamp value that returns all users updated after a given date & time.
  updated_until: 'updated_until_example', # String | An ISO8601 timestamp value that returns all users updated before a given date & time.
  last_login_since: 'last_login_since_example', # String | An ISO8601 timestamp value that returns all users that logged in after a given date & time.
  last_login_until: 'last_login_until_example', # String | 
  firstname: 'firstname_example', # String | The first name of the user
  lastname: 'lastname_example', # String | The last name of the user
  email: 'email_example', # String | The email address of the user
  username: 'username_example', # String | The username for the user
  samaccountname: 'samaccountname_example', # String | The AD login name for the user
  directory_id: 'directory_id_example', # String | The ID in OneLogin of the Directory that the user belongs to
  external_id: 'external_id_example', # String | An external identifier that has been set on the user
  app_id: 'app_id_example', # String | The ID of a OneLogin Application
  user_ids: 'user_ids_example', # String | A comma separated list of OneLogin User IDs
  custom_attributes_attribute_name: 'custom_attributes_attribute_name_example', # String | The short name of a custom attribute. Note that the attribute name is prefixed with custom_attributes.
  fields: 'fields_example' # String | A comma separated list user attributes to return.
}

begin
  
  result = api_instance.list_users(authorization, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_users: #{e}"
end
```

#### Using the list_users_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<User>>, Integer, Hash)> list_users_with_http_info(authorization, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.list_users_with_http_info(authorization, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<User>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->list_users_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **limit** | **Integer** | The total number of items returned per page. The maximum limit varies between endpoints, see the relevant endpoint documentation for the specific limit. | [optional] |
| **page** | **Integer** | The page number of results to return. | [optional] |
| **cursor** | **String** | Set to the value extracted from Before-Cursor or After-Cursor headers to return the previous or next page. | [optional] |
| **created_since** | **String** | An ISO8601 timestamp value that returns all users created after a given date &amp; time. | [optional] |
| **created_until** | **String** | An ISO8601 timestamp value that returns all users created before a given date &amp; time. | [optional] |
| **updated_since** | **String** | An ISO8601 timestamp value that returns all users updated after a given date &amp; time. | [optional] |
| **updated_until** | **String** | An ISO8601 timestamp value that returns all users updated before a given date &amp; time. | [optional] |
| **last_login_since** | **String** | An ISO8601 timestamp value that returns all users that logged in after a given date &amp; time. | [optional] |
| **last_login_until** | **String** |  | [optional] |
| **firstname** | **String** | The first name of the user | [optional] |
| **lastname** | **String** | The last name of the user | [optional] |
| **email** | **String** | The email address of the user | [optional] |
| **username** | **String** | The username for the user | [optional] |
| **samaccountname** | **String** | The AD login name for the user | [optional] |
| **directory_id** | **String** | The ID in OneLogin of the Directory that the user belongs to | [optional] |
| **external_id** | **String** | An external identifier that has been set on the user | [optional] |
| **app_id** | **String** | The ID of a OneLogin Application | [optional] |
| **user_ids** | **String** | A comma separated list of OneLogin User IDs | [optional] |
| **custom_attributes_attribute_name** | **String** | The short name of a custom attribute. Note that the attribute name is prefixed with custom_attributes. | [optional] |
| **fields** | **String** | A comma separated list user attributes to return. | [optional] |

### Return type

[**Array&lt;User&gt;**](User.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## remove_client_app

> remove_client_app(authorization, id, client_app_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 
client_app_id = 56 # Integer | 

begin
  
  api_instance.remove_client_app(authorization, id, client_app_id)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->remove_client_app: #{e}"
end
```

#### Using the remove_client_app_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> remove_client_app_with_http_info(authorization, id, client_app_id)

```ruby
begin
  
  data, status_code, headers = api_instance.remove_client_app_with_http_info(authorization, id, client_app_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->remove_client_app_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |
| **client_app_id** | **Integer** |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## remove_role_admins

> remove_role_admins(authorization, role_id, remove_role_users_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
role_id = 56 # Integer | Set to the id of the role you want to return.
remove_role_users_request = OneLogin::RemoveRoleUsersRequest.new # RemoveRoleUsersRequest | 

begin
  
  api_instance.remove_role_admins(authorization, role_id, remove_role_users_request)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->remove_role_admins: #{e}"
end
```

#### Using the remove_role_admins_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> remove_role_admins_with_http_info(authorization, role_id, remove_role_users_request)

```ruby
begin
  
  data, status_code, headers = api_instance.remove_role_admins_with_http_info(authorization, role_id, remove_role_users_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->remove_role_admins_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **role_id** | **Integer** | Set to the id of the role you want to return. |  |
| **remove_role_users_request** | [**RemoveRoleUsersRequest**](RemoveRoleUsersRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## remove_role_users

> remove_role_users(authorization, role_id, remove_role_users_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
role_id = 56 # Integer | Set to the id of the role you want to return.
remove_role_users_request = OneLogin::RemoveRoleUsersRequest.new # RemoveRoleUsersRequest | 

begin
  
  api_instance.remove_role_users(authorization, role_id, remove_role_users_request)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->remove_role_users: #{e}"
end
```

#### Using the remove_role_users_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> remove_role_users_with_http_info(authorization, role_id, remove_role_users_request)

```ruby
begin
  
  data, status_code, headers = api_instance.remove_role_users_with_http_info(authorization, role_id, remove_role_users_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->remove_role_users_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **role_id** | **Integer** | Set to the id of the role you want to return. |  |
| **remove_role_users_request** | [**RemoveRoleUsersRequest**](RemoveRoleUsersRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## revoke_token

> <GenerateToken400Response> revoke_token(authorization, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
opts = {
  revoke_token_request: OneLogin::RevokeTokenRequest.new # RevokeTokenRequest | 
}

begin
  
  result = api_instance.revoke_token(authorization, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->revoke_token: #{e}"
end
```

#### Using the revoke_token_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GenerateToken400Response>, Integer, Hash)> revoke_token_with_http_info(authorization, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.revoke_token_with_http_info(authorization, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GenerateToken400Response>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->revoke_token_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **revoke_token_request** | [**RevokeTokenRequest**](RevokeTokenRequest.md) |  | [optional] |

### Return type

[**GenerateToken400Response**](GenerateToken400Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## set_role_apps

> <Array<SetRoleApps200ResponseInner>> set_role_apps(authorization, role_id, request_body)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
role_id = 56 # Integer | Set to the id of the role you want to return.
request_body = [37] # Array<Integer> | 

begin
  
  result = api_instance.set_role_apps(authorization, role_id, request_body)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->set_role_apps: #{e}"
end
```

#### Using the set_role_apps_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<SetRoleApps200ResponseInner>>, Integer, Hash)> set_role_apps_with_http_info(authorization, role_id, request_body)

```ruby
begin
  
  data, status_code, headers = api_instance.set_role_apps_with_http_info(authorization, role_id, request_body)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<SetRoleApps200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->set_role_apps_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **role_id** | **Integer** | Set to the id of the role you want to return. |  |
| **request_body** | [**Array&lt;Integer&gt;**](Integer.md) |  |  |

### Return type

[**Array&lt;SetRoleApps200ResponseInner&gt;**](SetRoleApps200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## track_event

> track_event(authorization, track_event_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
track_event_request = OneLogin::TrackEventRequest.new({verb: 'verb_example', ip: 'ip_example', user_agent: 'user_agent_example', user: OneLogin::RiskUser.new({id: 'id_example'})}) # TrackEventRequest | 

begin
  
  api_instance.track_event(authorization, track_event_request)
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->track_event: #{e}"
end
```

#### Using the track_event_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> track_event_with_http_info(authorization, track_event_request)

```ruby
begin
  
  data, status_code, headers = api_instance.track_event_with_http_info(authorization, track_event_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->track_event_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **track_event_request** | [**TrackEventRequest**](TrackEventRequest.md) |  |  |

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: Not defined


## update_access_token_claim

> <Id> update_access_token_claim(authorization, id, claim_id, add_access_token_claim_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 
claim_id = 56 # Integer | 
add_access_token_claim_request = OneLogin::AddAccessTokenClaimRequest.new # AddAccessTokenClaimRequest | 

begin
  
  result = api_instance.update_access_token_claim(authorization, id, claim_id, add_access_token_claim_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_access_token_claim: #{e}"
end
```

#### Using the update_access_token_claim_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Id>, Integer, Hash)> update_access_token_claim_with_http_info(authorization, id, claim_id, add_access_token_claim_request)

```ruby
begin
  
  data, status_code, headers = api_instance.update_access_token_claim_with_http_info(authorization, id, claim_id, add_access_token_claim_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Id>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_access_token_claim_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |
| **claim_id** | **Integer** |  |  |
| **add_access_token_claim_request** | [**AddAccessTokenClaimRequest**](AddAccessTokenClaimRequest.md) |  |  |

### Return type

[**Id**](Id.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_app

> <Schema> update_app(authorization, app_id, schema)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
schema = OneLogin::Schema.new # Schema | 

begin
  
  result = api_instance.update_app(authorization, app_id, schema)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_app: #{e}"
end
```

#### Using the update_app_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Schema>, Integer, Hash)> update_app_with_http_info(authorization, app_id, schema)

```ruby
begin
  
  data, status_code, headers = api_instance.update_app_with_http_info(authorization, app_id, schema)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Schema>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_app_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **schema** | [**Schema**](Schema.md) |  |  |

### Return type

[**Schema**](Schema.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_authorization_server

> <Id> update_authorization_server(authorization, id, create_authorization_server_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 
create_authorization_server_request = OneLogin::CreateAuthorizationServerRequest.new # CreateAuthorizationServerRequest | 

begin
  
  result = api_instance.update_authorization_server(authorization, id, create_authorization_server_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_authorization_server: #{e}"
end
```

#### Using the update_authorization_server_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Id>, Integer, Hash)> update_authorization_server_with_http_info(authorization, id, create_authorization_server_request)

```ruby
begin
  
  data, status_code, headers = api_instance.update_authorization_server_with_http_info(authorization, id, create_authorization_server_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Id>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_authorization_server_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |
| **create_authorization_server_request** | [**CreateAuthorizationServerRequest**](CreateAuthorizationServerRequest.md) |  |  |

### Return type

[**Id**](Id.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_client_app

> <ClientApp> update_client_app(authorization, id, client_app_id, update_client_app_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 
client_app_id = 56 # Integer | 
update_client_app_request = OneLogin::UpdateClientAppRequest.new # UpdateClientAppRequest | 

begin
  
  result = api_instance.update_client_app(authorization, id, client_app_id, update_client_app_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_client_app: #{e}"
end
```

#### Using the update_client_app_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ClientApp>, Integer, Hash)> update_client_app_with_http_info(authorization, id, client_app_id, update_client_app_request)

```ruby
begin
  
  data, status_code, headers = api_instance.update_client_app_with_http_info(authorization, id, client_app_id, update_client_app_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ClientApp>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_client_app_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |
| **client_app_id** | **Integer** |  |  |
| **update_client_app_request** | [**UpdateClientAppRequest**](UpdateClientAppRequest.md) |  |  |

### Return type

[**ClientApp**](ClientApp.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_environment_variable

> <Envvar> update_environment_variable(authorization, envvar_id, update_environment_variable_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
envvar_id = 'envvar_id_example' # String | Set to the id of the Hook Environment Variable that you want to fetch.
update_environment_variable_request = OneLogin::UpdateEnvironmentVariableRequest.new({value: 'value_example'}) # UpdateEnvironmentVariableRequest | 

begin
  
  result = api_instance.update_environment_variable(authorization, envvar_id, update_environment_variable_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_environment_variable: #{e}"
end
```

#### Using the update_environment_variable_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Envvar>, Integer, Hash)> update_environment_variable_with_http_info(authorization, envvar_id, update_environment_variable_request)

```ruby
begin
  
  data, status_code, headers = api_instance.update_environment_variable_with_http_info(authorization, envvar_id, update_environment_variable_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Envvar>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_environment_variable_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **envvar_id** | **String** | Set to the id of the Hook Environment Variable that you want to fetch. |  |
| **update_environment_variable_request** | [**UpdateEnvironmentVariableRequest**](UpdateEnvironmentVariableRequest.md) |  |  |

### Return type

[**Envvar**](Envvar.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_hook

> <Hook> update_hook(authorization, hook_id, hook)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
hook_id = 'hook_id_example' # String | Set to the id of the Hook that you want to return.
hook = OneLogin::Hook.new({type: 'type_example', disabled: false, timeout: 37, env_vars: ['env_vars_example'], runtime: 'runtime_example', retries: 37, packages: 3.56, function: 'function_example'}) # Hook | 

begin
  
  result = api_instance.update_hook(authorization, hook_id, hook)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_hook: #{e}"
end
```

#### Using the update_hook_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Hook>, Integer, Hash)> update_hook_with_http_info(authorization, hook_id, hook)

```ruby
begin
  
  data, status_code, headers = api_instance.update_hook_with_http_info(authorization, hook_id, hook)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Hook>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_hook_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **hook_id** | **String** | Set to the id of the Hook that you want to return. |  |
| **hook** | [**Hook**](Hook.md) |  |  |

### Return type

[**Hook**](Hook.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_mapping

> Integer update_mapping(authorization, mapping_id, mapping)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
mapping_id = 56 # Integer | The id of the user mapping to locate.
mapping = OneLogin::Mapping.new({name: 'name_example', enabled: false, match: 'all', position: 37, actions: [OneLogin::Action.new]}) # Mapping | 

begin
  
  result = api_instance.update_mapping(authorization, mapping_id, mapping)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_mapping: #{e}"
end
```

#### Using the update_mapping_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Integer, Integer, Hash)> update_mapping_with_http_info(authorization, mapping_id, mapping)

```ruby
begin
  
  data, status_code, headers = api_instance.update_mapping_with_http_info(authorization, mapping_id, mapping)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Integer
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_mapping_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **mapping_id** | **Integer** | The id of the user mapping to locate. |  |
| **mapping** | [**Mapping**](Mapping.md) |  |  |

### Return type

**Integer**

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_risk_rule

> <RiskRule> update_risk_rule(authorization, risk_rule_id, risk_rule)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
risk_rule_id = 'risk_rule_id_example' # String | 
risk_rule = OneLogin::RiskRule.new # RiskRule | 

begin
  
  result = api_instance.update_risk_rule(authorization, risk_rule_id, risk_rule)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_risk_rule: #{e}"
end
```

#### Using the update_risk_rule_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RiskRule>, Integer, Hash)> update_risk_rule_with_http_info(authorization, risk_rule_id, risk_rule)

```ruby
begin
  
  data, status_code, headers = api_instance.update_risk_rule_with_http_info(authorization, risk_rule_id, risk_rule)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RiskRule>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_risk_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **risk_rule_id** | **String** |  |  |
| **risk_rule** | [**RiskRule**](RiskRule.md) |  |  |

### Return type

[**RiskRule**](RiskRule.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_role

> <UpdateRole200Response> update_role(authorization, role_id, role)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
role_id = 56 # Integer | Set to the id of the role you want to return.
role = OneLogin::Role.new({name: 'name_example'}) # Role | 

begin
  
  result = api_instance.update_role(authorization, role_id, role)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_role: #{e}"
end
```

#### Using the update_role_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UpdateRole200Response>, Integer, Hash)> update_role_with_http_info(authorization, role_id, role)

```ruby
begin
  
  data, status_code, headers = api_instance.update_role_with_http_info(authorization, role_id, role)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UpdateRole200Response>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_role_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **role_id** | **Integer** | Set to the id of the role you want to return. |  |
| **role** | [**Role**](Role.md) |  |  |

### Return type

[**UpdateRole200Response**](UpdateRole200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_rule

> <RuleId> update_rule(authorization, app_id, rule_id, rule)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
app_id = 56 # Integer | 
rule_id = 56 # Integer | The id of the app rule to locate.
rule = OneLogin::Rule.new # Rule | 

begin
  
  result = api_instance.update_rule(authorization, app_id, rule_id, rule)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_rule: #{e}"
end
```

#### Using the update_rule_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RuleId>, Integer, Hash)> update_rule_with_http_info(authorization, app_id, rule_id, rule)

```ruby
begin
  
  data, status_code, headers = api_instance.update_rule_with_http_info(authorization, app_id, rule_id, rule)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RuleId>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_rule_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **app_id** | **Integer** |  |  |
| **rule_id** | **Integer** | The id of the app rule to locate. |  |
| **rule** | [**Rule**](Rule.md) |  |  |

### Return type

[**RuleId**](RuleId.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_scope

> <Id> update_scope(authorization, id, scope_id, add_scope_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
id = 56 # Integer | 
scope_id = 56 # Integer | 
add_scope_request = OneLogin::AddScopeRequest.new # AddScopeRequest | 

begin
  
  result = api_instance.update_scope(authorization, id, scope_id, add_scope_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_scope: #{e}"
end
```

#### Using the update_scope_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Id>, Integer, Hash)> update_scope_with_http_info(authorization, id, scope_id, add_scope_request)

```ruby
begin
  
  data, status_code, headers = api_instance.update_scope_with_http_info(authorization, id, scope_id, add_scope_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Id>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_scope_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **id** | **Integer** |  |  |
| **scope_id** | **Integer** |  |  |
| **add_scope_request** | [**AddScopeRequest**](AddScopeRequest.md) |  |  |

### Return type

[**Id**](Id.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## update_user

> <User> update_user(authorization, user_id, user, opts)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user that you want to return.
user = OneLogin::User.new # User | 
opts = {
  mappings: 'async', # String | Controls how mappings will be applied to the user on creation. Defaults to async.
  validate_policy: true # Boolean | Will passwords validate against the User Policy? Defaults to true.
}

begin
  
  result = api_instance.update_user(authorization, user_id, user, opts)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_user: #{e}"
end
```

#### Using the update_user_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<User>, Integer, Hash)> update_user_with_http_info(authorization, user_id, user, opts)

```ruby
begin
  
  data, status_code, headers = api_instance.update_user_with_http_info(authorization, user_id, user, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <User>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->update_user_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user that you want to return. |  |
| **user** | [**User**](User.md) |  |  |
| **mappings** | **String** | Controls how mappings will be applied to the user on creation. Defaults to async. | [optional] |
| **validate_policy** | **Boolean** | Will passwords validate against the User Policy? Defaults to true. | [optional] |

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## verify_enrollment

> <Array<Registration>> verify_enrollment(authorization, user_id, registration_id, verify_enrollment_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user.
registration_id = 56 # Integer | Set to the uuid of the registration. This was included in the response as part of the initial request in Enroll Factor.
verify_enrollment_request = OneLogin::VerifyEnrollmentRequest.new # VerifyEnrollmentRequest | 

begin
  
  result = api_instance.verify_enrollment(authorization, user_id, registration_id, verify_enrollment_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->verify_enrollment: #{e}"
end
```

#### Using the verify_enrollment_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Registration>>, Integer, Hash)> verify_enrollment_with_http_info(authorization, user_id, registration_id, verify_enrollment_request)

```ruby
begin
  
  data, status_code, headers = api_instance.verify_enrollment_with_http_info(authorization, user_id, registration_id, verify_enrollment_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Registration>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->verify_enrollment_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user. |  |
| **registration_id** | **Integer** | Set to the uuid of the registration. This was included in the response as part of the initial request in Enroll Factor. |  |
| **verify_enrollment_request** | [**VerifyEnrollmentRequest**](VerifyEnrollmentRequest.md) |  |  |

### Return type

[**Array&lt;Registration&gt;**](Registration.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## verify_enrollment_voice_protect

> <Array<Registration>> verify_enrollment_voice_protect(authorization, user_id, registration_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user.
registration_id = 56 # Integer | Set to the uuid of the registration. This was included in the response as part of the initial request in Enroll Factor.

begin
  
  result = api_instance.verify_enrollment_voice_protect(authorization, user_id, registration_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->verify_enrollment_voice_protect: #{e}"
end
```

#### Using the verify_enrollment_voice_protect_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Registration>>, Integer, Hash)> verify_enrollment_voice_protect_with_http_info(authorization, user_id, registration_id)

```ruby
begin
  
  data, status_code, headers = api_instance.verify_enrollment_voice_protect_with_http_info(authorization, user_id, registration_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Registration>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->verify_enrollment_voice_protect_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user. |  |
| **registration_id** | **Integer** | Set to the uuid of the registration. This was included in the response as part of the initial request in Enroll Factor. |  |

### Return type

[**Array&lt;Registration&gt;**](Registration.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## verify_factor

> <Status2> verify_factor(authorization, user_id, verification_id, verify_factor_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user.
verification_id = 56 # Integer | The verification_id is returned on activation of the factor or you can get the device_id using the Activate Factor API call.
verify_factor_request = OneLogin::VerifyFactorRequest.new # VerifyFactorRequest | 

begin
  
  result = api_instance.verify_factor(authorization, user_id, verification_id, verify_factor_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->verify_factor: #{e}"
end
```

#### Using the verify_factor_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Status2>, Integer, Hash)> verify_factor_with_http_info(authorization, user_id, verification_id, verify_factor_request)

```ruby
begin
  
  data, status_code, headers = api_instance.verify_factor_with_http_info(authorization, user_id, verification_id, verify_factor_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Status2>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->verify_factor_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user. |  |
| **verification_id** | **Integer** | The verification_id is returned on activation of the factor or you can get the device_id using the Activate Factor API call. |  |
| **verify_factor_request** | [**VerifyFactorRequest**](VerifyFactorRequest.md) |  |  |

### Return type

[**Status2**](Status2.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## verify_factor_saml

> <VerifyFactorSaml200Response> verify_factor_saml(authorization, verify_factor_saml_request)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
verify_factor_saml_request = OneLogin::VerifyFactorSamlRequest.new({app_id: 'app_id_example', device_id: 'device_id_example', state_token: 'state_token_example'}) # VerifyFactorSamlRequest | 

begin
  
  result = api_instance.verify_factor_saml(authorization, verify_factor_saml_request)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->verify_factor_saml: #{e}"
end
```

#### Using the verify_factor_saml_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<VerifyFactorSaml200Response>, Integer, Hash)> verify_factor_saml_with_http_info(authorization, verify_factor_saml_request)

```ruby
begin
  
  data, status_code, headers = api_instance.verify_factor_saml_with_http_info(authorization, verify_factor_saml_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <VerifyFactorSaml200Response>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->verify_factor_saml_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **verify_factor_saml_request** | [**VerifyFactorSamlRequest**](VerifyFactorSamlRequest.md) |  |  |

### Return type

[**VerifyFactorSaml200Response**](VerifyFactorSaml200Response.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## verify_factor_voice

> <Array<VerifyFactorVoice200ResponseInner>> verify_factor_voice(authorization, user_id, verification_id)



### Examples

```ruby
require 'time'
require 'onelogin'

api_instance = OneLogin::DefaultApi.new
authorization = 'authorization_example' # String | 
user_id = 56 # Integer | Set to the id of the user.
verification_id = 56 # Integer | The verification_id is returned on activation of the factor or you can get the device_id using the Activate Factor API call.

begin
  
  result = api_instance.verify_factor_voice(authorization, user_id, verification_id)
  p result
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->verify_factor_voice: #{e}"
end
```

#### Using the verify_factor_voice_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<VerifyFactorVoice200ResponseInner>>, Integer, Hash)> verify_factor_voice_with_http_info(authorization, user_id, verification_id)

```ruby
begin
  
  data, status_code, headers = api_instance.verify_factor_voice_with_http_info(authorization, user_id, verification_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<VerifyFactorVoice200ResponseInner>>
rescue OneLogin::ApiError => e
  puts "Error when calling DefaultApi->verify_factor_voice_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **authorization** | **String** |  |  |
| **user_id** | **Integer** | Set to the id of the user. |  |
| **verification_id** | **Integer** | The verification_id is returned on activation of the factor or you can get the device_id using the Activate Factor API call. |  |

### Return type

[**Array&lt;VerifyFactorVoice200ResponseInner&gt;**](VerifyFactorVoice200ResponseInner.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

