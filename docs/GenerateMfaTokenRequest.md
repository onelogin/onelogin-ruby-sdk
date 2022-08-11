# OneLogin::GenerateMfaTokenRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **expires_in** | **String** | Set the duration of the token in seconds. | [optional] |
| **reusable** | **Boolean** | Defines if the token is reusable multiple times within the expiry window. | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::GenerateMfaTokenRequest.new(
  expires_in: null,
  reusable: null
)
```

