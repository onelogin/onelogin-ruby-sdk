# OpenapiClient::Schema1

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **name** | **String** |  | [optional] |
| **username** | **String** |  | [optional] |
| **added_by** | [**Schema1AddedBy**](Schema1AddedBy.md) |  | [optional] |
| **added_at** | **String** |  | [optional] |
| **assigned** | **Boolean** | Indicates if assigned to role or not. Defaults to true. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Schema1.new(
  id: null,
  name: null,
  username: null,
  added_by: null,
  added_at: null,
  assigned: null
)
```

