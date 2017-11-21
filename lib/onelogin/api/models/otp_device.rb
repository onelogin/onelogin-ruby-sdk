module OneLogin
  module Api
    module Models

      class OTPDevice

        attr_accessor :id, :active, :default, :auth_factor_name, :phone_number,
                      :type_display_name, :needs_trigger, :user_display_name,
                      :state_token

        def initialize(data)
          @id = data['id']? data['id'].to_i : nil
          @active = data['active']
          @default = data['default']
          @auth_factor_name = data['auth_factor_name']
          @phone_number = data['phone_number']
          @type_display_name = data['type_display_name']
          @needs_trigger = data['needs_trigger']
          @user_display_name = data['user_display_name']
          @state_token = data['state_token']
        end
      end
    end
  end
end