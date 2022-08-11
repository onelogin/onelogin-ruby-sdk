# OneLogin::Device

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **device_id** | **String** |  | [optional] |
| **user_display_name** | **String** |  | [optional] |
| **type_display_name** | **String** |  | [optional] |
| **auth_factor_name** | **String** |  | [optional] |
| **default** | **Boolean** |  | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::Device.new(
  device_id: null,
  user_display_name: null,
  type_display_name: null,
  auth_factor_name: null,
  default: null
)
```

