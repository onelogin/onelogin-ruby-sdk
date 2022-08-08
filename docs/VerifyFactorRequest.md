# OpenapiClient::VerifyFactorRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **otp** | **String** | OTP code provided by the device or SMS message sent to user. | [optional] |
| **device_id** | **Integer** | ID of the specified device which has been registerd for the given user. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::VerifyFactorRequest.new(
  otp: null,
  device_id: null
)
```

