# OpenapiClient::FactorInner

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | MFA device identifier. | [optional] |
| **status** | **String** | accepted : factor has been verified. pending: registered but has not been verified. | [optional] |
| **default** | **Boolean** | True &#x3D; is user&#39;s default MFA device for OneLogin. | [optional] |
| **auth_factor_name** | **String** | \&quot;Official\&quot; authentication factor name, as it appears to administrators in OneLogin. | [optional] |
| **type_display_name** | **String** | Authentication factor display name as it appears to users upon initial registration, as defined by admins at Settings &gt; Authentication Factors. | [optional] |
| **user_display_name** | **String** | Authentication factor display name assigned by users when they enroll the device. | [optional] |
| **expires_at** | **String** | A short lived token that is required to Verify the Factor. This token expires based on the expires_in parameter passed in. | [optional] |
| **factor_data** | [**FactorInnerFactorData**](FactorInnerFactorData.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::FactorInner.new(
  id: null,
  status: null,
  default: null,
  auth_factor_name: null,
  type_display_name: null,
  user_display_name: null,
  expires_at: null,
  factor_data: null
)
```

