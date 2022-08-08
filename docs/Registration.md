# OpenapiClient::Registration

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Registration identifier. | [optional] |
| **status** | **String** | pending registration has not been completed successfully. accepted registration has successfully completed. | [optional] |
| **device_id** | **String** | Device id to be used with Verify the Factor. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Registration.new(
  id: null,
  status: null,
  device_id: null
)
```

