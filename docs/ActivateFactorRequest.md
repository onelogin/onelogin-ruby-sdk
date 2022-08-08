# OpenapiClient::ActivateFactorRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **device_id** | **Integer** | Required. Specifies the factor to be verified. | [optional] |
| **expires_in** | **Integer** | Optional. Sets the window of time in seconds that the factor must be verified within.  | [optional] |
| **redirect_to** | **String** | Optional. Only applies to Email MagicLink factor. | [optional] |
| **custom_message** | **String** | Optional. Only applies to SMS factor. A message template that will be sent via SMS. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ActivateFactorRequest.new(
  device_id: null,
  expires_in: null,
  redirect_to: null,
  custom_message: null
)
```

