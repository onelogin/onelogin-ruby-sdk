# OneLogin::VerifyFactorSaml200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | **String** | Provides the SAML assertion. | [optional] |
| **message** | **String** | Plain text description describing the outcome of the response. | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::VerifyFactorSaml200Response.new(
  data: null,
  message: null
)
```

