module OneLogin
  module Api
    module Models

      class SessionTokenMFAInfo

        attr_accessor :user, :state_token, :callback_url, :devices

        def initialize(data)
          unless data['user'].empty?
            @user = OneLogin::Api::Models::User.new(data['user']) # Partial info
          end
          @state_token = data['state_token'].to_s
          @callback_url = data['callback_url'].to_s
          @devices = []
          unless data['devices'].empty?
            data['devices'].each do |device_data|
              @devices << OneLogin::Api::Models::Device.new(device_data)
            end
          end
        end
      end

    end
  end
end
