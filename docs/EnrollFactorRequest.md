# OneLogin::EnrollFactorRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **factor_id** | **Integer** | The identifier of the factor to enroll the user with. |  |
| **display_name** | **String** | A name for the users device. |  |
| **expires_in** | **String** | Defaults to 120. Valid values are: 120-900 seconds. | [optional] |
| **verified** | **Boolean** | Defaults to false. | [optional] |
| **redirect_to** | **String** | Redirects MagicLink success page to specified URL after 2 seconds. | [optional] |
| **custom_message** | **String** | A message template that will be sent via SMS. Max length of the message after template items are inserted is 160 characters including the OTP code. | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::EnrollFactorRequest.new(
  factor_id: null,
  display_name: null,
  expires_in: null,
  verified: null,
  redirect_to: null,
  custom_message: null
)
```

