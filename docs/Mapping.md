# OneLogin::Mapping

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **name** | **String** | The name of the mapping. |  |
| **enabled** | **Boolean** | Indicates if the mapping is enabled or not. |  |
| **match** | **String** | Indicates how conditions should be matched. |  |
| **position** | **Integer** | Indicates the order of the mapping. When &#x60;null&#x60; this will default to last position. |  |
| **conditions** | [**Array&lt;Condition&gt;**](Condition.md) | An array of conditions that the user must meet in order for the mapping to be applied. | [optional] |
| **actions** | [**Array&lt;Action&gt;**](Action.md) | An array of actions that will be applied to the users that are matched by the conditions. |  |

## Example

```ruby
require 'onelogin'

instance = OneLogin::Mapping.new(
  id: null,
  name: null,
  enabled: null,
  match: null,
  position: null,
  conditions: null,
  actions: null
)
```

