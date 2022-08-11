# OneLogin::HookOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **risk_enabled** | **Boolean** |  | [optional] |
| **location_enabled** | **Boolean** |  | [optional] |
| **mfa_device_info_enabled** | **Boolean** |  | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::HookOptions.new(
  risk_enabled: null,
  location_enabled: null,
  mfa_device_info_enabled: null
)
```

