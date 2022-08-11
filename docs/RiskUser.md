# OneLogin::RiskUser

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | A unique identifier for the user. |  |
| **name** | **String** | A name for the user. | [optional] |
| **authenticated** | **Boolean** | Indicates if the metadata supplied in this event should be considered as trusted for the user. | [optional][default to false] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::RiskUser.new(
  id: null,
  name: null,
  authenticated: null
)
```

