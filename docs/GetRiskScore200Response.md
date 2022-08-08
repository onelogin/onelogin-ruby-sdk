# OpenapiClient::GetRiskScore200Response

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **score** | **Float** | A risk score 0 is low risk and 100 is the highest risk level possible. | [optional] |
| **triggers** | **Array&lt;String&gt;** | Triggers are indicators of some of the key items that influenced the risk score. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::GetRiskScore200Response.new(
  score: null,
  triggers: null
)
```

