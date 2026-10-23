module OneLogin
  module Api
    module Models

      class App

        attr_accessor :id, :name, :icon, :provisioned
        attr_accessor :extension, :login_id, :personal
        attr_accessor :provisioning_enabled, :provisioning_state, :provisioning_status

        # v2 renames icon to icon_url and replaces provisioned and personal with
        # the provisioning_* fields. Its login_id is the numeric id of the
        # user's login, where v1 gives the username used to sign in.
        def initialize(data)
          @id = data['id']
          @name = data['name']
          @icon = data['icon'] || data['icon_url']
          @provisioned = data['provisioned']
          @extension = data['extension']
          @login_id = data['login_id']
          @personal = data['personal']
          @provisioning_enabled = data['provisioning_enabled']
          @provisioning_state = data['provisioning_state']
          @provisioning_status = data['provisioning_status']
        end
      end
    end
  end
end
