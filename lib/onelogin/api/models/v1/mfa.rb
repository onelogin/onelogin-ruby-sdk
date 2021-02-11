module OneLogin
  module Api
    module Models
      module V1

        class MFA

          attr_accessor :state_token, :callback_url, :user, :devices

          def initialize(data)
            unless data['user'].empty?
              @user = OneLogin::Api::Models::V1::User.new(data['user']) # Partial info
            end
            @state_token = data['state_token'].to_s
            @callback_url = data['callback_url'].to_s
            @devices = []
            unless data['devices'].empty?
              data['devices'].each do |device_data|
                @devices << OneLogin::Api::Models::V1::Device.new(device_data)
              end
            end
          end
        end
      end
    end
  end
end
