# OpenapiClient::TrackEventRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **verb** | **String** | Verbs are used to distinguish between different types of events. |  |
| **ip** | **String** | The IP address of the User&#39;s request. |  |
| **user_agent** | **String** | The user agent of the User&#39;s request. |  |
| **user** | [**RiskUser**](RiskUser.md) |  |  |
| **source** | [**Source**](Source.md) |  | [optional] |
| **session** | [**Session**](Session.md) |  | [optional] |
| **device** | [**RiskDevice**](RiskDevice.md) |  | [optional] |
| **fp** | **String** | Set to the value of the __tdli_fp cookie. | [optional] |
| **published** | **String** | Date and time of the event in IS08601 format. Useful for preloading old events. Defaults to date time this API request is received. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TrackEventRequest.new(
  verb: null,
  ip: null,
  user_agent: null,
  user: null,
  source: null,
  session: null,
  device: null,
  fp: null,
  published: null
)
```

