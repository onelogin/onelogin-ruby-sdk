# OneLogin::UpdateEnvironmentVariableRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **value** | **String** | The secret value that will be encrypted at rest and injected in applicable hook functions at run time. |  |

## Example

```ruby
require 'onelogin'

instance = OneLogin::UpdateEnvironmentVariableRequest.new(
  value: null
)
```

