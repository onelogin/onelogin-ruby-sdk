module OneLogin
  module Api
    module Models

      class SessionTokenInfo

        attr_accessor :status, :user, :return_to_url, :expires_at, :session_token

        def initialize(data)
          @status = data['status'].to_s
          unless data['user'].empty?
            @user = OneLogin::Api::Models::User.new(data['user']) # Partial info
          end
          @return_to_url = data['return_to_url'].to_s          
          @expires_at = Time.parse(data['expires_at'])
          @session_token = data['session_token'].to_s
        end
      end
    end
  end
end
