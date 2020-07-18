module OneLogin
  module Api
    module Models
      module V1

        class FactorEnrollmentResponse

          attr_accessor :device_id, :user_id, :active, :auth_factor_name,
                        :type_display_name, :user_display_name, :state_token

          def initialize(data)
            @device_id = data['device_id']? data['device_id'].to_i : nil
            @user_id = data['id']? data['id'].to_i : nil
            @active = data['active']
            @auth_factor_name = data['auth_factor_name']
            @type_display_name = data['type_display_name']
            @user_display_name = data['user_display_name']
            @state_token = data['state_token']
          end
        end
      end
    end
  end
end
