# OneLogin::Role

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **name** | **String** |  |  |
| **apps** | **Array&lt;Integer&gt;** |  | [optional] |
| **users** | **Array&lt;Integer&gt;** |  | [optional] |
| **admins** | **Array&lt;Integer&gt;** |  | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::Role.new(
  id: null,
  name: null,
  apps: null,
  users: null,
  admins: null
)
```

