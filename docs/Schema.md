# OneLogin::Schema

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | Apps unique ID in OneLogin. | [optional] |
| **connector_id** | **Integer** | ID of the apps underlying connector. | [optional] |
| **name** | **String** | App name. | [optional] |
| **description** | **String** | Freeform description of the app. | [optional] |
| **notes** | **String** | Freeform notes about the app. | [optional] |
| **policy_id** | **Integer** | The security policy assigned to the app. | [optional] |
| **brand_id** | **Integer** | The custom login page branding to use for this app. Applies to app initiated logins via OIDC or SAML. | [optional] |
| **icon_url** | **String** | A link to the apps icon url. | [optional] |
| **visible** | **Boolean** | Indicates if the app is visible in the OneLogin portal. | [optional] |
| **auth_method** | **Integer** | An ID indicating the type of app. | [optional] |
| **tab_id** | **Integer** | ID of the OneLogin portal tab that the app is assigned to. | [optional] |
| **created_at** | **String** | The date the app was created. | [optional] |
| **updated_at** | **String** | The date the app was last updated. | [optional] |
| **role_ids** | **Array&lt;Integer&gt;** | List of Role IDs that are assigned to the app. On App Create or Update the entire array is replaced with the values provided. | [optional] |
| **allow_assumed_signin** | **Boolean** | Indicates whether or not administrators can access the app as a user that they have assumed control over. | [optional] |
| **provisioning** | [**SchemaProvisioning**](SchemaProvisioning.md) |  | [optional] |
| **sso** | **Object** |  | [optional] |
| **configuration** | **Object** |  | [optional] |
| **parameters** | **Object** |  | [optional] |
| **enforcement_point** | **Object** |  | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::Schema.new(
  id: null,
  connector_id: null,
  name: null,
  description: null,
  notes: null,
  policy_id: null,
  brand_id: null,
  icon_url: null,
  visible: null,
  auth_method: null,
  tab_id: null,
  created_at: null,
  updated_at: null,
  role_ids: null,
  allow_assumed_signin: null,
  provisioning: null,
  sso: null,
  configuration: null,
  parameters: null,
  enforcement_point: null
)
```

