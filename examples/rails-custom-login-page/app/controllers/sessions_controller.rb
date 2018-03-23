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

  def destroy
    log_out
    redirect_to root_url
  end
end
