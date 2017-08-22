module OneLogin
  module Api
    module Models

      class OneLoginToken

        attr_accessor :access_token, :refresh_token, :account_id, :token_type, :created_at, :expires_in

        def initialize(data)
          @access_token = data['access_token'].to_s
          @refresh_token = data['refresh_token'].to_s
          @account_id = data['account_id']
          @token_type = data['token_type']
          @created_at = Time.iso8601(data['created_at'])
          @expires_in = data['expires_in']
        end
      end
    end
  end
end
