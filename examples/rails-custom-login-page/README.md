# Customized Login Page

This sample is a default [Ruby on Rails 5](http://rubyonrails.org/) app that makes use of the OneLogin ruby sdk for authenticating users.

It is the recommended approach when building a customized login flow where you want complete control
over the look &amp; feel.

The downside to this approach is that you have to implement MFA and password resets etc yourself. However we do have the APIs for these actions available and have demonstrated how to use them in this app.

If you want a standards based, out of the box way to authenticate users then we recommend you use [our OpenId Connect implementation](https://github.com/onelogin/onelogin-oidc-ruby).

## Get Started

The sample tries to keep everything as simple as possible so only
implements
* Login - Authenticate users in a single request to OneLogin with out any redirects
* MFA - Does MFA verification if required
* Password Reset with user verification via MFA
* Self sign Up / Create a new user
* Onboard / Activate a user
* User Apps - List apps available to a user and provides SSO links
* User Roles - Lists a users roles
* Logout - destroying the local session and revoking the token at OneLogin

In order to run this sample you need API credentials for a OneLogin account. If you don't have a OneLogin developer account [you can sign up here](https://www.onelogin.com/developer-signup).

1. Clone this repo

```sh
git clone https://github.com/onelogin/onelogin-ruby-sdk.git
```

2. Move to the rails example and install the required gems
```sh
cd onelogin-ruby-sdk/examples/rails-custom-login-page && bundle install
```

3. Rename `config/secrets.yml.sample` to `config/secrets.yml` and update with your OneLogin API credentials, region and subdomain.

If you are using a custom domain instance, set it
in order to be used for the login demo.

If you want to set the cookie via post-form set
COOKIE_VIA_POST_FORM to true, otherwise the cookie
will be set via javascript via the makeCors method
described later.

```yaml
development:
  secret_key_base: xxx
  ONELOGIN_CLIENT_ID: xxx
  ONELOGIN_CLIENT_SECRET: xxx
  ONELOGIN_REGION: us
  ONELOGIN_SUBDOMAIN: xxx
  CUSTOM_DOMAIN: xxx
  COOKIE_VIA_POST_FORM: true
```
4. Run the sample and browse to `http://localhost:3000`
```sh
rails s
```

The `/dashboard` route renders a protected page to prove the authentication works and creates a session. You will need to be authenticated to view it. If you are not authenticate you will be redirected back to the login page.

### Authenticate the user

*helpers/sessions_helper.rb*
```ruby
response = api_client.create_session_login_token({
    'username_or_email' => username,
    'password' => password,
    'subdomain' => ONELOGIN_SUBDOMAIN,
  },
  request.base_url # included for CORS session cookie request
)
```

### Verify MFA

*helpers/sessions_helper.rb*
```ruby
response = api_client.get_session_token_verified(
  device_id,
  session[:state_token],
  otp_token,
  request.base_url
)
```

### Destroy the session

*helpers/sessions_helper.rb*
```ruby
api_client.log_user_out(current_user_id)
session.delete(:user)
```

### Make CORS request to establish SSO session

Using the `session_token` returned from the `session_controller` after a new login or successful MFA verification.

*views/home/index.html.erb*
```javascript
function makeCors(session_token) {
  var xhr = new XMLHttpRequest();
  xhr.withCredentials = true;
  method = "POST";
  var url = "https://" + ONELOGIN_SUBDOMAIN + ".onelogin.com/session_via_api_token";
  // var url = "https://" + CUSTOM_DOMAIN + "/session_via_api_token";
  xhr.open(method, url, true);
  xhr.setRequestHeader("Content-Type", "application/json");
  body = {"session_token": session_token};
  xhr.send(JSON.stringify(body));
};
```

### Make form-based request to establish SSO session
```html
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
    </head>
    <body>
        <p>Auth API Test</p>
        <form action=
         "https://{onelogin_instance}/session_via_api_token" method="POST">
            <input type="hidden" name="session_token" value="{your session token value}">
            <input type="submit" placeholder="GO">
            <input id="auth_token" type="hidden">
        </form>
    </body>
</html>

where onelogin_instance is a custom domain or
{subdomain}.onelogin.com
```
