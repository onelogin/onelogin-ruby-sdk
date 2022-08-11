# OneLogin::GetRiskScoreRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ip** | **String** | The IP address of the User&#39;s request. |  |
| **user_agent** | **String** | The user agent of the User&#39;s request. |  |
| **user** | [**RiskUser**](RiskUser.md) |  |  |
| **source** | [**Source**](Source.md) |  | [optional] |
| **session** | [**Session**](Session.md) |  | [optional] |
| **device** | [**RiskDevice**](RiskDevice.md) |  | [optional] |
| **fp** | **String** | Set to the value of the __tdli_fp cookie. | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::GetRiskScoreRequest.new(
  ip: null,
  user_agent: null,
  user: null,
  source: null,
  session: null,
  device: null,
  fp: null
)
```

