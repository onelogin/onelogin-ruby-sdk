# OneLogin::CreateAuthorizationServerRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** |  | [optional] |
| **description** | **String** |  | [optional] |
| **configuration** | [**AuthServerConfiguration**](AuthServerConfiguration.md) |  | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::CreateAuthorizationServerRequest.new(
  name: null,
  description: null,
  configuration: null
)
```

