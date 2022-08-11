# OneLogin::CreateEnvironmentVariableRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name for the environment variable that will be used to retrieve the value from a hook function. |  |
| **value** | **String** | The secret value that will be encrypted at rest and injected in applicable hook functions at run time. |  |

## Example

```ruby
require 'onelogin'

instance = OneLogin::CreateEnvironmentVariableRequest.new(
  name: null,
  value: null
)
```

