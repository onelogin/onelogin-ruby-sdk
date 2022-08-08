# OpenapiClient::GenerateMfaTokenRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **expires_in** | **String** | Set the duration of the token in seconds. | [optional] |
| **reusable** | **Boolean** | Defines if the token is reusable multiple times within the expiry window. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GenerateMfaTokenRequest.new(
  expires_in: null,
  reusable: null
)
```

