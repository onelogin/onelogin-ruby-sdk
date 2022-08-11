# OneLogin::GenerateMfaToken200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **mfa_token** | **String** | Token can function as a temporary MFA token. It can be used to authenticate for any app when valid. | [optional] |
| **reusable** | **Boolean** | true indcates the token can be used multiple times. false indicates the token is invalid after a single use | [optional] |
| **expires_at** | **String** | Defines the expiration time and date for the token. Format is UTC time. | [optional] |
| **device_id** | **String** | Defines the expiration time and date for the token. Format is UTC time. | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::GenerateMfaToken200Response.new(
  mfa_token: null,
  reusable: null,
  expires_at: null,
  device_id: null
)
```

