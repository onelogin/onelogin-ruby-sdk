# OneLogin::User

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **username** | **String** | A username for the user. | [optional] |
| **email** | **String** | A valid email for the user. | [optional] |
| **firstname** | **String** | The user&#39;s first name. | [optional] |
| **lastname** | **String** | The user&#39;s last name. | [optional] |
| **title** | **String** | The user&#39;s job title. | [optional] |
| **department** | **String** | The user&#39;s department. | [optional] |
| **company** | **String** | The user&#39;s company. | [optional] |
| **comment** | **String** | Free text related to the user. | [optional] |
| **group_id** | **Integer** | The ID of the Group in OneLogin that the user is assigned to. | [optional] |
| **role_ids** | **Array&lt;Integer&gt;** | A list of OneLogin Role IDs of the user | [optional] |
| **phone** | **String** | The E.164 format phone number for a user. | [optional] |
| **state** | **Integer** |  | [optional] |
| **status** | **Integer** |  | [optional] |
| **directory_id** | **Integer** | The ID of the OneLogin Directory of the user. | [optional] |
| **trusted_idp_id** | **Integer** | The ID of the OneLogin Trusted IDP of the user. | [optional] |
| **manager_ad_id** | **String** | The ID of the user&#39;s manager in Active Directory. | [optional] |
| **manager_user_id** | **String** | The OneLogin User ID for the user&#39;s manager. | [optional] |
| **samaccount_name** | **String** | The user&#39;s Active Directory username. | [optional] |
| **member_of** | **String** | The user&#39;s directory membership. | [optional] |
| **userprincipalname** | **String** | The principle name of the user. | [optional] |
| **distinguished_name** | **String** | The distinguished name of the user. | [optional] |
| **external_id** | **String** | The ID of the user in an external directory. | [optional] |
| **activated_at** | **String** |  | [optional] |
| **last_login** | **String** |  | [optional] |
| **invitation_sent_at** | **String** |  | [optional] |
| **updated_at** | **String** |  | [optional] |
| **preferred_locale_code** | **String** |  | [optional] |
| **created_at** | **String** |  | [optional] |
| **custom_attributes** | **Object** |  | [optional] |
| **invalid_login_attempts** | **Integer** |  | [optional] |
| **locked_until** | **String** |  | [optional] |
| **password_changed_at** | **String** |  | [optional] |
| **password** | **String** | The password to set for a user. | [optional] |
| **password_confirmation** | **String** | Required if the password is being set. | [optional] |
| **password_algorithm** | **String** | Use this when importing a password that&#39;s already hashed. Prepend the salt value to the cleartext password value before SHA-256-encoding it | [optional] |
| **salt** | **String** | The salt value used with the password_algorithm. | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::User.new(
  id: null,
  username: null,
  email: null,
  firstname: null,
  lastname: null,
  title: null,
  department: null,
  company: null,
  comment: null,
  group_id: null,
  role_ids: null,
  phone: null,
  state: null,
  status: null,
  directory_id: null,
  trusted_idp_id: null,
  manager_ad_id: null,
  manager_user_id: null,
  samaccount_name: null,
  member_of: null,
  userprincipalname: null,
  distinguished_name: null,
  external_id: null,
  activated_at: null,
  last_login: null,
  invitation_sent_at: null,
  updated_at: null,
  preferred_locale_code: null,
  created_at: null,
  custom_attributes: null,
  invalid_login_attempts: null,
  locked_until: null,
  password_changed_at: null,
  password: null,
  password_confirmation: null,
  password_algorithm: null,
  salt: null
)
```

