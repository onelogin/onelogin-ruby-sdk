# OpenapiClient::FactorInnerFactorData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **verification_token** | **String** | The token which can be used to verify the factor registration. | [optional] |
| **totp_url** | **String** | OTP Url that can be leveraged for any authenticator that supports the key uri format. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::FactorInnerFactorData.new(
  verification_token: null,
  totp_url: null
)
```

