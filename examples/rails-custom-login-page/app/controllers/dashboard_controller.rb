class DashboardController < ApplicationController
  include DashboardHelper

  before_action :require_current_user

  def index
    @apps = user_apps
    @roles = user_roles
  end
end
