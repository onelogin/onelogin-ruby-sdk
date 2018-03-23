module SessionsHelper

  def log_in(username, password)
    response = api_client.create_session_login_token({
        'username_or_email' => username,
        'password' => password,
        'subdomain' => ONELOGIN_SUBDOMAIN,
      },
      request.base_url # included for CORS session cookie request
    )
    return nil unless response

    if response.is_a? OneLogin::Api::Models::SessionTokenMFAInfo
      session[:state_token] = response.state_token
      {
        requires_mfa: true,
        devices: response.devices
      }
    else
      create_session(response.user)
      {
        requires_mfa: false,
        session_token: response.session_token
      }
    end
  end

  def verify_mfa(device_id, otp_token)
    response = api_client.get_session_token_verified(
      device_id,
      session[:state_token],
      otp_token,
      request.base_url
    )
    return nil unless response

    create_session(response.user)
    {
      session_token: response.session_token
    }
  end

  def create_session(user)
    session[:user] = user
  end

  def log_out
    return unless current_user
    api_client.log_user_out(current_user_id)
    session.delete(:user)
  end

  def current_user
    session[:user]
  end

  def current_user_id
    session[:user]['id'] if current_user
  end
end
