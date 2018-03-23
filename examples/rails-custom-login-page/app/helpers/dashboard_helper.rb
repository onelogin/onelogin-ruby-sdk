module DashboardHelper

  #
  # Get a list of app for the current user
  #
  def user_apps
    api_client.get_user_apps(current_user_id)
  end

  #
  # Get a list of roles for the current user
  #
  def user_roles
    role_ids = api_client.get_user_roles(current_user_id)

    roles.map do |role|
      role if role_ids.include?(role.id)
    end.compact
  end

  #
  # Get a list of all roles in onelogin account
  #
  def roles
    @roles ||= api_client.get_roles
  end

end
