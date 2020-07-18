module SessionsHelper

  def log_in(username, password)
    response = api_client.create_session_login_token({
        'username_or_email' => username,
        'password' => password,
        'subdomain' => ONELOGIN_SUBDOMAIN,
      },
      request.base_url # included for CORS session cookie request
    )
    return { error: api_client.error_description } unless response

    if response.is_a? OneLogin::Api::Models::V1::SessionTokenMFAInfo
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

  def validate_user(username)
    user = api_client.get_users_v1(username: username).first

    if user
      session[:user_id] = user.id
    end

    user
  end

  def get_mfa_devices(user_id)
    devices = api_client.get_enrolled_factors(user_id)

    # only return devices that dont need a trigger.
    # i.e. this sample does not support push yet
    devices.select {|d| d.needs_trigger == true }
  end

  def verify_token(device_id, mfa_token)
    puts "VERIFY MFA TOKEN User:#{session[:user_id]}, Device:#{device_id}, Token:#{mfa_token}"
    api_client.verify_factor(session[:user_id], device_id, mfa_token)
  end

  def set_password(user_id, password)
    api_client.set_password_using_clear_text(user_id, password, password)
  end
end
