class SessionsController < ApplicationController
  def new
    response = log_in(params['username'], params['password'])
    status = response ? :ok : :unauthorized

    render json: response, status: status
  end

  def verify
    response = verify_mfa(params['device_id'], params['otp_token'])
    status = response ? :ok : :unauthorized

    render json: response, status: status
  end

  # Checks for user and gets MFA devices
  # available to verify token before
  # password reset is completed
  def forgot_password
    user = validate_user(params['username'])

    devices = get_mfa_devices(user.id)

    status = user ? :ok : :not_found

    render json: devices, status: status
  end

  # Verify MFA token and then update password
  def reset_password
    if verify_token(params['device_id'], params['otp_token'])
      status = :ok
      response = set_password(session[:user_id], params['password'])
    else
      status = :unauthorized
      response = 'Invalid token'
    end

    render json: response, status: status
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
