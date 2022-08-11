# OneLogin::AuthServerConfiguration

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **audiences** | **Array&lt;String&gt;** |  | [optional] |
| **refresh_token_expiration_minutes** | **Integer** |  | [optional] |
| **resource_identifier** | **String** |  | [optional] |
| **access_token_expiration_minutes** | **Integer** |  | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::AuthServerConfiguration.new(
  audiences: null,
  refresh_token_expiration_minutes: null,
  resource_identifier: null,
  access_token_expiration_minutes: null
)
```

