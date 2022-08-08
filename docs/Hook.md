# OpenapiClient::Hook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | The Hook unique ID in OneLogin. | [optional] |
| **type** | **String** | A string describing the type of hook. e.g. &#x60;pre-authentication&#x60; |  |
| **disabled** | **Boolean** | Boolean to enable or disable the hook. Disabled hooks will not run. | [default to true] |
| **timeout** | **Integer** | The number of seconds to allow the hook function to run before before timing out. Maximum timeout varies based on the type of hook. | [default to 1] |
| **env_vars** | **Array&lt;String&gt;** | Environment Variable objects that will be available via process.env.ENV_VAR_NAME in the hook code. |  |
| **runtime** | **String** | The Smart Hooks supported Node.js version to execute this hook with. |  |
| **retries** | **Integer** | Number of retries if execution fails. | [default to 0] |
| **packages** | **Object** | An object containing NPM packages that are bundled with the hook function. |  |
| **function** | **String** | A base64 encoded string containing the javascript function code. |  |
| **context_version** | **String** | The semantic version of the content that will be injected into this hook. | [optional] |
| **status** | **String** | String describing the state of the hook function. When a hook is ready and disabled is false it will be executed. | [optional] |
| **options** | [**HookOptions**](HookOptions.md) |  | [optional] |
| **conditions** | [**Array&lt;HookConditionsInner&gt;**](HookConditionsInner.md) | An array of objects that let you limit the execution of a hook to users in specific roles. | [optional] |
| **created_at** | **String** | ISO8601 format date that they hook function was created. | [optional] |
| **updated_at** | **String** | ISO8601 format date that they hook function was last updated. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Hook.new(
  id: null,
  type: null,
  disabled: null,
  timeout: null,
  env_vars: null,
  runtime: null,
  retries: null,
  packages: null,
  function: null,
  context_version: null,
  status: null,
  options: null,
  conditions: null,
  created_at: null,
  updated_at: null
)
```

