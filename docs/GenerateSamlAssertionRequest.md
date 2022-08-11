# OneLogin::GenerateSamlAssertionRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **username_or_email** | **String** | Set this to the username or email of the OneLogin user accessing the app for which you want to generate a SAML token. |  |
| **password** | **String** | Password of the OneLogin user accessing the app for which you want to generate a SAML token. |  |
| **app_id** | **String** | App ID of the app for which you want to generate a SAML token. This is the app ID in OneLogin. |  |
| **subdomain** | **String** | Set to the subdomain of the OneLogin user accessing the app for which you want to generate a SAML token. |  |
| **ip_address** | **String** | Whitelisted IP address, if MFA is required and you need to honor IP address whitelisting defined in MFA policies. | [optional] |

## Example

```ruby
require 'onelogin'

instance = OneLogin::GenerateSamlAssertionRequest.new(
  username_or_email: null,
  password: null,
  app_id: null,
  subdomain: null,
  ip_address: null
)
```

