# OpenapiClient::GetUserApps200ResponseInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The App ID | [optional] |
| **icon_url** | **String** | A url for the icon that represents the app in the OneLogin portal | [optional] |
| **extension** | **Boolean** | Boolean that indicates if the OneLogin browser extension is required to launch this app. | [optional] |
| **login_id** | **Integer** | Unqiue identifier for this user and app combination. | [optional] |
| **name** | **String** | The name of the app. | [optional] |
| **provisioning_status** | **String** |  | [optional] |
| **provisioning_state** | **String** | If provisioning is enabled this indicates the state of provisioning for the given user. | [optional] |
| **provisioning_enabled** | **Boolean** | Indicates if provisioning is enabled for this app. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GetUserApps200ResponseInner.new(
  id: null,
  icon_url: null,
  extension: null,
  login_id: null,
  name: null,
  provisioning_status: null,
  provisioning_state: null,
  provisioning_enabled: null
)
```

