require 'onelogin'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def require_current_user
    if current_user
      return true
    else
      redirect_to root_url, error: "Please sign in."
      return false
    end
  end

  def api_client
    @api_client ||= OneLogin::Api::Client.new(
      client_id: ONELOGIN_CLIENT_ID,
      client_secret: ONELOGIN_CLIENT_SECRET,
      region: ONELOGIN_REGION
    )
  end
end
