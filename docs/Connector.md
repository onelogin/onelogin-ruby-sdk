# OpenapiClient::Connector

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** | The connectors unique ID in OneLogin. | [optional] |
| **name** | **String** | The name of the connector. | [optional] |
| **auth_method** | [**AuthMethod**](AuthMethod.md) |  | [optional] |
| **allows_new_parameters** | **Boolean** | Indicates if apps created using this connector will be allowed to create custom parameters. | [optional] |
| **icon_url** | **String** | A link to the apps icon url. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Connector.new(
  id: null,
  name: null,
  auth_method: null,
  allows_new_parameters: null,
  icon_url: null
)
```

