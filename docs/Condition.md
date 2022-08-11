# OneLogin::Condition

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **source** | **String** | The source field to check. | [optional] |
| **operator** | **String** | A valid operator for the selected condition source | [optional] |
| **value** | **String** | A plain text string or valid value for the selected condition source. | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::Condition.new(
  source: null,
  operator: null,
  value: null
)
```

