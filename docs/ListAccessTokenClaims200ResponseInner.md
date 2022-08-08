# OpenapiClient::ListAccessTokenClaims200ResponseInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **Integer** |  | [optional] |
| **label** | **String** |  | [optional] |
| **user_attribute_mappings** | **String** |  | [optional] |
| **user_attribute_macros** | **String** |  | [optional] |
| **attributes_transformations** | **String** |  | [optional] |
| **skip_if_blank** | **Boolean** |  | [optional] |
| **values** | **Array&lt;String&gt;** |  | [optional] |
| **default_values** | **String** |  | [optional] |
| **provisioned_entitlements** | **Boolean** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ListAccessTokenClaims200ResponseInner.new(
  id: null,
  label: null,
  user_attribute_mappings: null,
  user_attribute_macros: null,
  attributes_transformations: null,
  skip_if_blank: null,
  values: null,
  default_values: null,
  provisioned_entitlements: null
)
```

