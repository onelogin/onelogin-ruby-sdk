module OneLogin
  module Api
    module Models

      class MFAToken

        attr_accessor :value, :expires_at, :reusable

        def initialize(data)
          @value = data['mfa_token']
          @expires_at = data['expires_at']
          @reusable = data['reusable']
        end
      end

    end
  end
end
