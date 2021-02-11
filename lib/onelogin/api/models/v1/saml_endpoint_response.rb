module OneLogin
  module Api
    module Models
      module V1

        class SAMLEndpointResponse

          attr_accessor :type, :message, :mfa, :saml_response

          def initialize(status_type, status_message)
            @type = status_type
            @message = status_message
            @saml_response = nil
            @mfa = nil
          end
        end
      end
    end
  end
end
