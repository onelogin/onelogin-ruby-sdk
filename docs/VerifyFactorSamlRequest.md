# OpenapiClient::VerifyFactorSamlRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **app_id** | **String** | App ID of the app for which you want to generate a SAML token. This is the app ID in OneLogin. |  |
| **device_id** | **String** | Provide the MFA device_id you are submitting for verification. The device_id is supplied by the Generate SAML Assertion API. |  |
| **state_token** | **String** | state_token associated with the MFA device_id you are submitting. The state_token is supplied by the Generate SAML Assertion API. |  |
| **otp_token** | **String** | Provide the OTP value for the MFA factor you are submitting for verification. | [optional] |
| **do_not_notify** | **Boolean** | When verifying MFA via Protect Push, set this to true to stop additional push notifications being sent to the OneLogin Protect device. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::VerifyFactorSamlRequest.new(
  app_id: null,
  device_id: null,
  state_token: null,
  otp_token: null,
  do_not_notify: null
)
```

