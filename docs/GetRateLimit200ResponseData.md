# OneLogin::GetRateLimit200ResponseData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **x_rate_limit_limit** | **Integer** |  | [optional] |
| **x_rate_limit_remaining** | **Integer** |  | [optional] |
| **x_rate_limit_reset** | **Integer** |  | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::GetRateLimit200ResponseData.new(
  x_rate_limit_limit: null,
  x_rate_limit_remaining: null,
  x_rate_limit_reset: null
)
```

