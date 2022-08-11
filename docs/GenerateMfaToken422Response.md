# OneLogin::GenerateMfaToken422Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status_code** | **Integer** |  | [optional] |
| **name** | **String** |  | [optional] |
| **message** | **String** |  | [optional] |
| **details** | [**GenerateMfaToken422ResponseDetails**](GenerateMfaToken422ResponseDetails.md) |  | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::GenerateMfaToken422Response.new(
  status_code: null,
  name: null,
  message: null,
  details: null
)
```

