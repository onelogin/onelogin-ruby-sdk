# OneLogin::GetAvailableFactors200ResponseInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **factor_id** | **Integer** | Identifier for the factor which will be used for user enrollment | [optional] |
| **name** | **String** | Authentication factor name, as it appears to administrators in OneLogin. | [optional] |
| **auth_factor_name** | **String** | Internal use only | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::GetAvailableFactors200ResponseInner.new(
  factor_id: null,
  name: null,
  auth_factor_name: null
)
```

