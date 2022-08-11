# OneLogin::Log

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_id** | **String** |  | [optional] |
| **correlation_id** | **String** |  | [optional] |
| **created_at** | **String** |  | [optional] |
| **events** | **Array&lt;String&gt;** |  | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::Log.new(
  request_id: null,
  correlation_id: null,
  created_at: null,
  events: null
)
```

