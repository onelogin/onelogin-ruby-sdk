# OneLogin::RiskRule

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  | [optional] |
| **name** | **String** | The name of this rule | [optional] |
| **description** | **String** |  | [optional] |
| **type** | **String** | The type parameter specifies the type of rule that will be created. | [optional] |
| **target** | **String** | The target parameter that will be used when evaluating the rule against an incoming event. | [optional] |
| **filters** | **Array&lt;String&gt;** | A list of IP addresses or country codes or names to evaluate against each event. | [optional] |
| **source** | [**Source**](Source.md) |  | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::RiskRule.new(
  id: null,
  name: null,
  description: null,
  type: null,
  target: null,
  filters: null,
  source: null
)
```

