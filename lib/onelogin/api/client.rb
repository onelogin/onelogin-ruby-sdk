require 'onelogin/version'
require 'onelogin/api/apiexception'
require 'onelogin/api/cursor'
require 'onelogin/api/util'
require 'json'
require 'httparty'
require 'nokogiri'
require 'time'

module OneLogin
  module Api
    # Client class
  	#
  	# Client class of the OneLogin's Ruby SDK.
  	# It makes the API calls to the Onelogin's platform described
    # at https://developers.onelogin.com/api-docs/1/getting-started/dev-overview.
  	#
    class Client
      include OneLogin::Api::Util
      include HTTParty

      attr_accessor :client_id, :client_secret, :region
      attr_accessor :user_agent, :error, :error_description, :error_attribute

      NOKOGIRI_OPTIONS = Nokogiri::XML::ParseOptions::STRICT |
                         Nokogiri::XML::ParseOptions::NONET

      DEFAULT_USER_AGENT = "onelogin-ruby-sdk v#{OneLogin::VERSION}".freeze

      # Create a new instance of the Client.
      #
      # @param config [Hash] Client Id, Client Secret and Region
      #
      def initialize(config)
        options = Hash[config.map { |(k, v)| [k.to_sym, v] }]

        @client_id = options[:client_id]
        @client_secret = options[:client_secret]
        @region = options[:region] || 'us'
        @max_results = options[:max_results] || 1000

        if options[:timeout] and defined? self.class.default_timeout
          self.class.default_timeout options[:timeout]
        end

        if options[:proxy_host]
          self.class.http_proxy options[:proxy_host], options[:proxy_port], options[:proxy_user], options[:proxy_pass]
        end

        self.class.default_options.update(verify: false)

        validate_config

        @user_agent = DEFAULT_USER_AGENT
      end

      def validate_config
        raise ArgumentError, 'client_id & client_secret are required' unless @client_id && @client_secret
      end

      # Clean any previous error registered at the client.
      #
      def clean_error
        @error = nil
        @error_description = nil
        @error_attribute = nil
      end

      def expired?
        Time.now.utc > @expiration
      end

      def prepare_token
        if @access_token.nil?
          access_token
        elsif expired?
          regenerate_token
        end
      end

      def handle_operation_response(response)
        result = false
        begin
          content = JSON.parse(response.body)
          if content
            if content.has_key?('status') && content['status'].has_key?('type') && content['status']['type'] == "success"
              result = true
            elsif content.has_key?('success') && content['success']
              result = true
            end
          end
        rescue Exception => e
          result = false
        end

        result
      end

      def handle_session_token_response(response)
        content = JSON.parse(response.body)
        if content && content.has_key?('status') && content['status'].has_key?('message') && content.has_key?('data')
          if content['status']['message'] == "Success"
            return OneLogin::Api::Models::V1::SessionTokenInfo.new(content['data'][0])
          elsif content['status']['message'] == "MFA is required for this user"
            return OneLogin::Api::Models::V1::SessionTokenMFAInfo.new(content['data'][0])
          else
            raise "Status Message type not reognized: %s" % content['status']['message']
          end
        end

        nil
      end

      def handle_saml_endpoint_response(response)
        content = JSON.parse(response.body)
        if content && content.has_key?('status') && content['status'].has_key?('message') && content['status'].has_key?('type')
          status_type = content['status']['type']
          status_message = content['status']['message']
          saml_endpoint_response = OneLogin::Api::Models::V1::SAMLEndpointResponse.new(status_type, status_message)
          if content.has_key?('data')
            if status_message == 'Success'
              saml_endpoint_response.saml_response = content['data']
            else
              mfa = OneLogin::Api::Models::V1::MFA.new(content['data'][0])
              saml_endpoint_response.mfa = mfa
            end
          end

          return saml_endpoint_response
        end

        nil
      end

      def headers
        {
          'Content-Type' => 'application/json',
          'User-Agent' => @user_agent
        }
      end

      def authorized_headers(bearer = true)
        # Removed the ":"
        authorization = if bearer
          "bearer #{@access_token}"
        else
          "client_id:#{@client_id},client_secret:#{@client_secret}"
        end

        headers.merge({
          'Authorization' => authorization
        })
      end

      ############################
      # OAuth 2.0 Tokens Methods #
      ############################

      # Generates an access token and refresh token that you may use to
      # call Onelogin's API methods.
      #
      # @return [OneLoginToken] Returns the generated OAuth Token info
      #
      # @see {https://developers.onelogin.com/api-docs/1/oauth20-tokens/generate-tokens Generate Tokens documentation}
      def access_token
        clean_error

        begin
          url = url_for(TOKEN_REQUEST_URL)

          data = {
            'grant_type' => 'client_credentials'
          }

          response = self.class.post(
            url,
            headers: authorized_headers(false),
            body: data.to_json
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data.has_key?('status')
              @error = json_data['status']['code'].to_s
              @error_description = extract_error_message_from_response(response)
            else
              token = OneLogin::Api::Models::V1::OneLoginToken.new(json_data)
              @access_token = token.access_token
              @refresh_token = token.refresh_token
              @expiration = token.created_at + token.expires_in
              return token
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Refreshing tokens provides a new set of access and refresh tokens.
      #
      # @return [OneLoginToken] Returns the refreshed OAuth Token info
      #
      # @see {https://developers.onelogin.com/api-docs/1/oauth20-tokens/refresh-tokens Refresh Tokens documentation}
      def regenerate_token
        clean_error

        begin
          url = url_for(TOKEN_REQUEST_URL)

          data = {
            'grant_type' => 'refresh_token',
            'access_token' => @access_token,
            'refresh_token' => @refresh_token
          }

          response = self.class.post(
            url,
            headers: headers,
            body: data.to_json
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data.has_key?('status')
              @error = json_data['status']['code'].to_s
              @error_description = extract_error_message_from_response(response)
            else
              token = OneLogin::Api::Models::V1::OneLoginToken.new(json_data)
              @access_token = token.access_token
              @refresh_token = token.refresh_token
              @expiration = token.created_at + token.expires_in
              return token
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Revokes an access token and refresh token pair.
      #
      # @return [Boolean] If the opeation succeded
      #
      # @see {https://developers.onelogin.com/api-docs/1/oauth20-tokens/revoke-tokens Revoke Tokens documentation}
      def revoke_token
        clean_error

        begin
          url = url_for(TOKEN_REVOKE_URL)

          data = {
            access_token: @access_token
          }

          response = self.class.post(
            url,
            headers: authorized_headers(false),
            body: data.to_json
          )

          if response.code == 200
            @access_token = nil
            @refresh_token = nil
            @expiration = nil
            return true
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Gets current rate limit details about an access token.
      #
      # @return [RateLimit] Returns the rate limit info
      #
      # @see {https://developers.onelogin.com/api-docs/1/oauth20-tokens/get-rate-limit Get Rate Limit documentation}
      def get_rate_limits
        clean_error
        prepare_token

        begin
          url = url_for(GET_RATE_URL)

          response = self.class.get(
            url,
            headers: authorized_headers
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data['data']
              return OneLogin::Api::Models::V1::RateLimit.new(json_data['data'])
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      ################
      # User Methods #
      ################

      # Gets a list of User resources.
      #
      # @param params [Hash] Parameters to filter the result of the list
      #
      # @return [Array] list of User objects
      #
      # @see {https://developers.onelogin.com/api-docs/2/users/get-users List Users documentation}
      def list_users(params = {})
        clean_error
        prepare_token

        begin
          url = url_for(LIST_USERS_URL)

          users = []
          response = self.class.get(
            url,
            headers: authorized_headers,
            query: params
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if !json_data.empty?
              json_data.each do |data|
                users << OneLogin::Api::Models::V2::User.new(data)
              end
            end
            return users
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Gets a list of User resources. (if no limit provided, by default gt 50 elements)
      #
      # @param params [Hash] Parameters to filter the result of the list
      #
      # @return [Array] list of User objects
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/get-users Get Users documentation}
      def get_users_v1(params = {})
        clean_error
        prepare_token

        begin
          options = {
            model: OneLogin::Api::Models::V1::User,
            headers: authorized_headers,
            max_results: @max_results,
            params: params
          }

          return Cursor.new(self, url_for(GET_USERS_URL), options)

        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Gets User by ID.
      #
      # @param user_id [Integer] Id of the user
      #
      # @return [User] the user identified by the id
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/get-user-by-id Get User by ID documentation}
      def get_user(user_id)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(GET_USER_URL, user_id)

          response = self.class.get(
            url,
            headers: authorized_headers
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data['data']
              return OneLogin::Api::Models::V1::User.new(json_data['data'][0])
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Gets a list of apps accessible by a user, not including personal apps.
      #
      # @param user_id [Integer] Id of the user
      #
      # @return [Array] the apps of the user identified by the id
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/get-apps-for-user Get Apps for a User documentation}
      def get_user_apps(user_id)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          options = {
            model: OneLogin::Api::Models::V1::App,
            headers: authorized_headers,
            max_results: @max_results
          }

          return Cursor.new(self, url_for(GET_APPS_FOR_USER_URL, user_id), options)

        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Gets a list of role IDs that have been assigned to a user.
      #
      # @param user_id [Integer] Id of the user
      #
      # @return [Array] the role ids of the user identified by the id
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/get-roles-for-user Get Roles for a User documentation}
      def get_user_roles(user_id)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(GET_ROLES_FOR_USER_URL, user_id)

          response = self.class.get(
            url,
            headers: authorized_headers
          )

          role_ids = []
          if response.code == 200
            json_data = JSON.parse(response.body)
            role_ids = json_data['data'][0] if json_data && json_data['data']
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end

          return role_ids
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Gets a list of all custom attribute fields (also known as custom user fields) that have been defined for OL account.
      #
      # @return [Array] the custom attributes of the account
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/get-custom-attributes Get Custom Attributes documentation}
      def get_custom_attributes
        clean_error
        prepare_token

        begin
          url = url_for(GET_CUSTOM_ATTRIBUTES_URL)

          response = self.class.get(
            url,
            headers: authorized_headers
          )

          custom_attributes = []
          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data['data']
              custom_attributes = json_data['data'][0]
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end

          return custom_attributes
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Creates an user
      #
      # @param user_params [Hash] User data (firstname, lastname, email, username, company,
      #                                      department, directory_id, distinguished_name,
      #                                      external_id, group_id, invalid_login_attempts,
      #                                      locale_code, manager_ad_id, member_of,
      #                                      openid_name, phone, samaccountname, title,
      #                                      userprincipalname)
      #
      # @return [User] the created user
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/create-user Create User documentation}
      def create_user(user_params)
        clean_error
        prepare_token

        begin
          url = url_for(CREATE_USER_URL)

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: user_params.to_json
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data['data']
              return OneLogin::Api::Models::V1::User.new(json_data['data'][0])
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Updates an user
      #
      # @param user_id [Integer] Id of the user
      # @param user_params [Hash] User data (firstname, lastname, email, username, company,
      #                                      department, directory_id, distinguished_name,
      #                                      external_id, group_id, invalid_login_attempts,
      #                                      locale_code, manager_ad_id, member_of,
      #                                      openid_name, phone, samaccountname, title,
      #                                      userprincipalname)
      #
      # @return [User] the modified user
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/update-user Update User by ID documentation}
      def update_user(user_id, user_params)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(UPDATE_USER_URL, user_id)

          response = self.class.put(
            url,
            headers: authorized_headers,
            body: user_params.to_json
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data['data']
              return OneLogin::Api::Models::V1::User.new(json_data['data'][0])
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Assigns Roles to User
      #
      # @param user_id [Integer] Id of the user
      # @param role_ids [Array] List of role ids to be added
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/assign-role-to-user Assign Role to User documentation}
      def assign_role_to_user(user_id, role_ids)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(ADD_ROLE_TO_USER_URL, user_id)

          data = {
            'role_id_array' => role_ids
          }

          response = self.class.put(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Removes Role from User
      #
      # @param user_id [Integer] Id of the user
      # @param role_ids [Array] List of role ids to be removed
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/remove-role-from-user Remove Role from User documentation}
      def remove_role_from_user(user_id, role_ids)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(DELETE_ROLE_TO_USER_URL, user_id)

          data = {
            'role_id_array' => role_ids
          }

          response = self.class.put(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Sets Password by ID Using Cleartext
      #
      # @param user_id [Integer] Id of the user
      # @param password [String] Set to the password value using cleartext.
      # @param password_confirmation [String] Ensure that this value matches the password value exactly.
      # @validate_policy [Boolean] Force validation against assigned OneLogin user password policy
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/set-password-in-cleartext Set Password by ID Using Cleartext documentation}
      def set_password_using_clear_text(user_id, password, password_confirmation, validate_policy=false)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(SET_PW_CLEARTEXT, user_id)

          data = {
            'password' => password,
            'password_confirmation' => password_confirmation,
            'validate_policy' => validate_policy
          }

          response = self.class.put(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Set Password by ID Using Salt and SHA-256
      #
      # @param user_id [Integer] Id of the user
      # @param password [String] Set to the password value using cleartext.
      # @param password_confirmation [String] Ensure that this value matches the password value exactly.
      # @param password_algorithm [String] Set to salt+sha256.
      # @param password_salt [String] (Optional) To provide your own salt value.
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/set-password-using-sha-256 Set Password by ID Using Salt and SHA-256 documentation}
      def set_password_using_hash_salt(user_id, password, password_confirmation, password_algorithm, password_salt=nil)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(SET_PW_SALT, user_id)

          data = {
            'password' => password,
            'password_confirmation' => password_confirmation,
            'password_algorithm' => password_algorithm
          }

          unless password_salt.nil?
            data['password_salt'] = password_salt
          end

          response = self.class.put(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Set User State
      #
      # @param id [Integer] Id of the user to be modified
      # @param state [Integer] Set to the state value. [Unapproved: 0, Approved (licensed): 1, Rejected: 2, Unlicensed: 3]
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/set-state Set User State documentation}
      def set_state_to_user(user_id, state)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(SET_USER_STATE_URL, user_id)

          data = {
            'state' => state
          }

          response = self.class.put(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Set Custom Attribute Value
      #
      # @param user_id [Integer] Id of the user
      # @param custom_attributes [Hash] Provide one or more key value pairs composed of the custom attribute field shortname and the value that you want to set the field to.
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/set-custom-attribute Set Custom Attribute Value documentation}
      def set_custom_attribute_to_user(user_id, custom_attributes)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(SET_CUSTOM_ATTRIBUTE_TO_USER_URL, user_id)

          data = {
            'custom_attributes' => custom_attributes
          }

          response = self.class.put(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Log a user out of any and all sessions.
      #
      # @param user_id [Integer] Id of the user to be logged out
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/log-user-out Log User Out documentation}
      def log_user_out(user_id)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(LOG_USER_OUT_URL, user_id)

          response = self.class.put(
            url,
            headers: authorized_headers
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Use this call to lock a user's account based on the policy assigned to
      # the user, for a specific time you define in the request, or until you
      # unlock it.
      #
      # @param user_id [Integer] Id of the user to be locked
      # @param minutes [Integer] Set to the number of minutes for which you want to lock the user account. (0 to delegate on policy)
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/lock-user-account Lock User Account documentation}
      def lock_user(user_id, minutes)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(LOCK_USER_URL, user_id)

          data = {
            'locked_until' => minutes
          }

          response = self.class.put(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Deletes an user
      #
      # @param user_id [Integer] Id of the user to be removed
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/delete-user Delete User by ID documentation}
      def delete_user(user_id)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(DELETE_USER_URL, user_id)

          response = self.class.delete(
            url,
            headers: authorized_headers
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Use to generate a temporary MFA token that can be used in place of other MFA tokens for a set time period.
      # For example, use this token for account recovery.
      #
      # @param user_id [Integer] Id of the user
      # @param expires_in [Integer] Set the duration of the token in seconds.
      #                             (default: 259200 seconds = 72h) 72 hours is the max value.
      # @param reusable [Boolean] Defines if the token reusable. (default: false) If set to true, token can be used for multiple apps, until it expires.
      #
      # @return [MFAToken] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/multi-factor-authentication/generate-mfa-token Generate MFA Token documentation}
      def generate_mfa_token(user_id, expires_in=259200, reusable=false)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(GENERATE_MFA_TOKEN_URL, user_id)

          data = {
            'expires_in' => expires_in,
            'reusable' => reusable
          }

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 201
            json_data = JSON.parse(response.body)
            if !json_data.empty?
              return OneLogin::Api::Models::V1::MFAToken.new(json_data)
            end
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Generates a session login token in scenarios in which MFA may or may not be required.
      # A session login token expires two minutes after creation.
      #
      # @param query_params [Hash] Query Parameters (username_or_email, password, subdomain, return_to_url,
      #                                              ip_address, browser_id)
      # @param allowed_origin [String] Custom-Allowed-Origin-Header. Required for CORS requests only.
      #                                Set to the Origin URI from which you are allowed to send a request
      #                                using CORS.
      #
      # @return [SessionTokenInfo|SessionTokenMFAInfo] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/create-session-login-token Create Session Login Token documentation}
      def create_session_login_token(query_params, allowed_origin='')
        clean_error
        prepare_token

        begin
          url = url_for(SESSION_LOGIN_TOKEN_URL)

          if query_params.nil? || !query_params.has_key?('username_or_email') || !query_params.has_key?('password') || !query_params.has_key?('subdomain')
            raise "username_or_email, password and subdomain are required parameters"
          end

          headers = authorized_headers
          if allowed_origin
            headers = headers.merge({ 'Custom-Allowed-Origin-Header-1' => allowed_origin })
          end

          response = self.class.post(
            url,
            headers: headers,
            body: query_params.to_json
          )

          if response.code == 200
            return handle_session_token_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Verify a one-time password (OTP) value provided for multi-factor authentication (MFA).
      #
      # @param device_id [String] Provide the MFA device_id you are submitting for verification.
      # @param state_token [String] Provide the state_token associated with the MFA device_id you are submitting for verification.
      # @param otp_token [String] (Optional) Provide the OTP value for the MFA factor you are submitting for verification.
      # @param allowed_origin [String] (Optional) Required for CORS requests only. Set to the Origin URI from which you are allowed to send a request using CORS.
      # @param do_not_notify [String] (Optional) When verifying MFA via Protect Push, set this to true to stop additional push notifications being sent to the OneLogin Protect device.
      #
      # @return [SessionTokenInfo] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/users/verify-factor Verify Factor documentation}
      def get_session_token_verified(device_id, state_token, otp_token=nil, allowed_origin='', do_not_notify=false)
        clean_error
        prepare_token

        begin
          if device_id.nil? || device_id.to_s.empty?
            @error = '400'
            @error_description = "device_id is required"
            @error_attribute = "device_id"
            return
          end

          url = url_for(GET_TOKEN_VERIFY_FACTOR)

          data = {
            'device_id'=> device_id.to_s,
            'state_token'=> state_token,
            'do_not_notify'=> do_not_notify
          }

          unless otp_token.nil? || otp_token.empty?
            data['otp_token'] = otp_token
          end

          headers = authorized_headers
          if allowed_origin
            headers = headers.merge({ 'Custom-Allowed-Origin-Header-1' => allowed_origin })
          end

          response = self.class.post(
            url,
            headers: headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_session_token_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      ###############################
      # Onelogin Connectors Methods #
      ###############################

      # Gets a list of Connector resources.
      #
      # @param params [Hash] Parameters to filter the result of the list
      #
      # @return [Array] list of Connector objects
      #
      # @see {https://developers.onelogin.com/api-docs/1/connectors/list-connectors List Connectors documentation}
      def get_connectors(params = {})
        clean_error
        prepare_token

        begin
          url = url_for(GET_CONNECTORS_URL)

          connectors = []
          response = self.class.get(
            url,
            headers: authorized_headers,
            query: params
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if !json_data.empty?
              json_data.each do |data|
                pp data
                connectors << OneLogin::Api::Models::V1::ConnectorBasic.new(data)
              end
            end
            return connectors
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      #########################
      # Onelogin Apps Methods #
      #########################

      # Gets a list of OneLoginAppV1 resources. (if no limit provided, by default get 50 elements)
      #
      # @param params [Hash] Parameters to filter the result of the list
      #
      # @return [Array] list of OneLoginAppV1 objects
      #
      # @see {https://developers.onelogin.com/api-docs/1/apps/get-apps Get Apps documentation}
      def get_apps_v1(params = {})
        clean_error
        prepare_token

        begin
          options = {
            model: OneLogin::Api::Models::V1::OneLoginAppV1,
            headers: authorized_headers,
            max_results: @max_results,
            params: params
          }

          return Cursor.new(self, url_for(GET_APPS_URL_V1), options)

        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Gets a list of OneLoginAppBasic resources.
      #
      # @param params [Hash] Parameters to filter the result of the list
      #
      # @return [Array] list of OneLoginAppBasic objects
      #
      # @see {https://developers.onelogin.com/api-docs/1/apps/list-apps Get Apps documentation}
      def get_apps(params = {})
        clean_error
        prepare_token

        begin
          url = url_for(GET_APPS_URL)

          apps = []
          response = self.class.get(
            url,
            headers: authorized_headers,
            query: params
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if !json_data.empty?
              json_data.each do |data|
                apps << OneLogin::Api::Models::V1::OneLoginAppBasic.new(data)
              end
            end
            return apps
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Creates an app
      #
      # @param app_params [Hash] App data (name, visible, policy_id, is_available, parameters, allow_assumed_signin,
      #                                    configuration, notes, description, provisioning,
      #                                    connector_id, auth_method, tab_id)
      #
      # @return [OneLoginApp] the created app
      #
      # @see {https://developers.onelogin.com/api-docs/1/apps/create-app Create App documentation}
      def create_app(app_params)
        clean_error
        prepare_token

        begin
          url = url_for(CREATE_APP_URL)

          unless app_params.has_key?('connector_id') || app_params['connector_id'].to_s.empty?
            @error = '400'
            @error_description = "connector_id is required"
            @error_attribute = "connector_id"
            return
          end

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: app_params.to_json
          )

          if response.code == 201
            json_data = JSON.parse(response.body)
            if json_data && json_data.has_key?('id')
              return OneLogin::Api::Models::V1::OneLoginApp.new(json_data)
            end
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Gets a OneLoginApp resource.
      #
      # @return [OneLoginApp] OneLoginApp object
      #
      # @see {https://developers.onelogin.com/api-docs/1/apps/get-app Get App documentation}
      def get_app(app_id)
        clean_error
        prepare_token

        begin
          if app_id.nil? || app_id.to_s.empty?
            @error = '400'
            @error_description = "app_id is required"
            @error_attribute = "app_id"
            return
          end

          url = url_for(GET_APP_URL, app_id)

          response = self.class.get(
            url,
            headers: authorized_headers
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data.has_key?('id')
              return OneLogin::Api::Models::V1::OneLoginApp.new(json_data)
            end
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Updates an app
      #
      # @param app_id [Integer] Id of the app
      # @param app_params [Hash] App data (name, visible, policy_id, is_available, parameters, allow_assumed_signin,
      #                                    configuration, notes, description, provisioning,
      #                                    connector_id, auth_method, tab_id)
      #
      # @return [User] the modified user
      #
      # @see {https://developers.onelogin.com/api-docs/1/apps/update-app Update App by ID documentation}
      def update_app(app_id, app_params)
        clean_error
        prepare_token

        begin
          if app_id.nil? || app_id.to_s.empty?
            @error = '400'
            @error_description = "app_id is required"
            @error_attribute = "app_id"
            return
          end

          url = url_for(UPDATE_APP_URL, app_id)

          response = self.class.put(
            url,
            headers: authorized_headers,
            body: app_params.to_json
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data.has_key?('id')
              return OneLogin::Api::Models::V1::OneLoginApp.new(json_data)
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Deletes an app
      #
      # @param app_id [Integer] Id of the app to be removed
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/apps/delete-app Delete App by ID documentation}
      def delete_app(app_id)
        clean_error
        prepare_token

        begin
          if app_id.nil? || app_id.to_s.empty?
            @error = '400'
            @error_description = "app_id is required"
            @error_attribute = "app_id"
            return
          end

          url = url_for(DELETE_APP_URL, app_id)

          response = self.class.delete(
            url,
            headers: authorized_headers
          )

          if response.code == 204
            return true
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Deletes an App Parameter
      #
      # @param app_id [Integer] Id of the app
      # @param parameter_id [Integer] Id of the parameter to be removed
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/apps/delete-parameter Delete an App Parameter documentation}
      def delete_parameter_from_app(app_id, parameter_id)
        clean_error
        prepare_token

        begin
          if app_id.nil? || app_id.to_s.empty?
            @error = '400'
            @error_description = "app_id is required"
            @error_attribute = "app_id"
            return
          end

          if parameter_id.nil? || parameter_id.to_s.empty?
            @error = '400'
            @error_description = "parameter_id is required"
            @error_attribute = "parameter_id"
            return
          end

          url = url_for(DELETE_APP_PARAMETER_URL, app_id, parameter_id)

          response = self.class.delete(
            url,
            headers: authorized_headers
          )

          if response.code == 204
            return true
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # List users of a specific app
      #
      # @param app_id [Integer] Id of the app
      # @param params [Hash] Parameters to filter the result of the list
      #
      # @return [Array] list of UserBasic objects
      #
      # @see {https://developers.onelogin.com/api-docs/2/apps/list-users List App Users documentation}
      def list_app_users(app_id, params = {})
        clean_error
        prepare_token

        begin
          url = url_for(LIST_APP_USERS_URL, app_id)

          users = []
          response = self.class.get(
            url,
            headers: authorized_headers,
            query: params
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if !json_data.empty?
              json_data.each do |data|
                users << OneLogin::Api::Models::V2::UserBasic.new(data)
              end
            end
            return users
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      ################
      # Role Methods #
      ################

      # Gets a list of Role resources. (if no limit provided, by default get 50 elements)
      #
      # @param params [Hash] Parameters to filter the result of the list
      #
      # @return [Array] list of Role objects
      #
      # @see {https://developers.onelogin.com/api-docs/1/roles/get-roles Get Roles documentation}
      def get_roles(params = {})
        clean_error
        prepare_token

        begin
          options = {
            model: OneLogin::Api::Models::V1::Role,
            headers: authorized_headers,
            max_results: @max_results,
            params: params
          }

          return Cursor.new(self, url_for(GET_ROLES_URL), options)

        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Gets Role by ID.
      #
      # @param role_id [Integer] Id of the Role
      #
      # @return [Role] the role identified by the id
      #
      # @see {https://developers.onelogin.com/api-docs/1/roles/get-role-by-id Get Role by ID documentation}
      def get_role(role_id)
        clean_error
        prepare_token

        begin
          if role_id.nil? || role_id.to_s.empty?
            @error = '400'
            @error_description = "role_id is required"
            @error_attribute = "role_id"
            return
          end

          url = url_for(GET_ROLE_URL, role_id)

          response = self.class.get(
            url,
            headers: authorized_headers
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data['data']
              return OneLogin::Api::Models::V1::Role.new(json_data['data'][0])
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      #################
      # Event Methods #
      #################

      # List of all OneLogin event types available to the Events API.
      #
      # @return [Array] the list of event type
      #
      # @see {https://developers.onelogin.com/api-docs/1/events/event-types Get Event Types documentation}
      def get_event_types
        clean_error
        prepare_token

        begin
          options = {
            model: OneLogin::Api::Models::V1::EventType,
            headers: authorized_headers,
            max_results: @max_results
          }

          return Cursor.new(self, url_for(GET_EVENT_TYPES_URL), options)

        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Gets a list of Event resources. (if no limit provided, by default get 50 elements)
      #
      # @param params [Hash] Parameters to filter the result of the list
      #
      # @return [Array] list of Event objects
      #
      # @see {https://developers.onelogin.com/api-docs/1/events/get-events Get Events documentation}
      def get_events(params={})
        clean_error
        prepare_token

        begin
          options = {
            model: OneLogin::Api::Models::V1::Event,
            headers: authorized_headers,
            max_results: @max_results,
            params: params
          }

          return Cursor.new(self, url_for(GET_EVENTS_URL), options)

        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Gets Event by ID.
      #
      # @param event_id [Integer] Id of the Event
      #
      # @return [Event] the event identified by the id
      #
      # @see {https://developers.onelogin.com/api-docs/1/events/get-event-by-id Get Event by ID documentation}
      def get_event(event_id)
        clean_error
        prepare_token

        begin
          if event_id.nil? || event_id.to_s.empty?
            @error = '400'
            @error_description = "event_id is required"
            @error_attribute = "event_id"
            return
          end

          url = url_for(GET_EVENT_URL, event_id)

          response = self.class.get(
            url,
            headers: authorized_headers
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data['data']
              return OneLogin::Api::Models::V1::Event.new(json_data['data'][0])
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Create an event in the OneLogin event log.
      #
      # @param event_params [Hash] Event data (event_type_id, account_id, actor_system,
      #                                        actor_user_id, actor_user_name, app_id,
      #                                        assuming_acting_user_id, custom_message,
      #                                        directory_sync_run_id, group_id, group_name,
      #                                        ipaddr, otp_device_id, otp_device_name,
      #                                        policy_id, policy_name, role_id, role_name,
      #                                        user_id, user_name)
      #
      # @return [Boolean] the result of the operation
      #
      # @see {https://developers.onelogin.com/api-docs/1/events/create-event Create Event documentation}
      def create_event(event_params)
        clean_error
        prepare_token

        begin
          url = url_for(CREATE_EVENT_URL)

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: event_params.to_json
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            @error_attribute = extract_error_attribute_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      #################
      # Group Methods #
      #################

      # Gets a list of Group resources (element of groups limited with the limit parameter).
      #
      # @return [Array] the list of groups
      #
      # @see {https://developers.onelogin.com/api-docs/1/groups/get-groups Get Groups documentation}
      def get_groups(params = {})
        clean_error
        prepare_token

        begin
          options = {
            model: OneLogin::Api::Models::V1::Group,
            headers: authorized_headers,
            max_results: @max_results,
            params: params
          }

          return Cursor.new(self, url_for(GET_GROUPS_URL), options)

        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Gets Group by ID.
      #
      # @param group_id [Integer] Id of the Group
      #
      # @return [Group] the group identified by the id
      #
      # @see {https://developers.onelogin.com/api-docs/1/groups/get-group-by-id Get Group by ID documentation}
      def get_group(group_id)
        clean_error
        prepare_token

        begin
          if group_id.nil? || group_id.to_s.empty?
            @error = '400'
            @error_description = "group_id is required"
            @error_attribute = "group_id"
            return
          end

          url = url_for(GET_GROUP_URL, group_id)

          response = self.class.get(
            url,
            headers: authorized_headers
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data['data']
              return OneLogin::Api::Models::V1::Group.new(json_data['data'][0])
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      ##########################
      # SAML Assertion Methods #
      ##########################

      # Generates a SAML Assertion.
      #
      # @param username_or_email [String] username or email of the OneLogin user accessing the app
      # @param password [String] Password of the OneLogin user accessing the app
      # @param app_id [String] App ID of the app for which you want to generate a SAML token
      # @param subdomain [String] subdomain of the OneLogin account related to the user/app
      # @param ip_address [String] (Optional) whitelisted IP address that needs to be bypassed (some MFA scenarios)
      #
      # @return [SAMLEndpointResponse] object with an encoded SAMLResponse
      #
      # @see {https://developers.onelogin.com/api-docs/1/saml-assertions/generate-saml-assertion Generate SAML Assertion documentation}
      def get_saml_assertion(username_or_email, password, app_id, subdomain, ip_address=nil)
        clean_error
        prepare_token

        begin
          url = url_for(GET_SAML_ASSERTION_URL)

          data = {
            'username_or_email'=> username_or_email,
            'password'=> password,
            'app_id'=> app_id,
            'subdomain'=> subdomain,
          }

          unless ip_address.nil? || ip_address.empty?
            data['ip_address'] = ip_address
          end

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_saml_endpoint_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Verify a one-time password (OTP) value provided for a second factor when multi-factor authentication (MFA) is required for SAML authentication.
      #
      # @param app_id [String] App ID of the app for which you want to generate a SAML token
      # @param devide_id [String] Provide the MFA device_id you are submitting for verification.
      # @param state_token [String] Provide the state_token associated with the MFA device_id you are submitting for verification.
      # @param otp_token [String] (Optional) Provide the OTP value for the MFA factor you are submitting for verification.
      # @param url_endpoint [String] (Optional) Specify an url where return the response.
      # @param do_not_notify [String] (Optional) When verifying MFA via Protect Push, set this to true to stop additional push notifications being sent to the OneLogin Protect device
      #
      # @return [SAMLEndpointResponse] object with an encoded SAMLResponse
      #
      # @see {https://developers.onelogin.com/api-docs/1/saml-assertions/verify-factor Verify Factor documentation}
      def get_saml_assertion_verifying(app_id, device_id, state_token, otp_token=nil, url_endpoint=nil, do_not_notify=false)
        clean_error
        prepare_token

        begin
          if app_id.nil? || app_id.to_s.empty?
            @error = '400'
            @error_description = "app_id is required"
            @error_attribute = "app_id"
            return
          end

          if device_id.nil? || device_id.to_s.empty?
            @error = '400'
            @error_description = "device_id is required"
            @error_attribute = "device_id"
            return
          end

          if url_endpoint.nil? || url_endpoint.empty?
            url = url_for(GET_SAML_VERIFY_FACTOR)
          else
            url = url_endpoint
          end

          data = {
            'app_id'=> app_id,
            'device_id'=> device_id.to_s,
            'state_token'=> state_token,
            'do_not_notify'=> do_not_notify
          }

          unless otp_token.nil? || otp_token.empty?
            data['otp_token'] = otp_token
          end

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_saml_endpoint_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      #############################
      # Multi-factor Auth Methods #
      #############################

      # Returns a list of authentication factors that are available for user enrollment via API.
      #
      # @param user_id [Integer] The id of the user.
      #
      # @return [Array] AuthFactor list
      #
      # @see {https://developers.onelogin.com/api-docs/1/multi-factor-authentication/available-factors Get Available Authentication Factors documentation}
      def get_factors(user_id)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(GET_FACTORS_URL, user_id)

          response = self.class.get(
            url,
            :headers => authorized_headers
          )

          factors = []
          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data and json_data['data'] and json_data['data']['auth_factors']
              json_data['data']['auth_factors'].each do |factor_data|
                factors << OneLogin::Api::Models::V1::AuthFactor.new(factor_data)
              end
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
          return factors
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Enroll a user with a given authentication factor.
      #
      # @param user_id [Integer] The id of the user.
      # @param factor_id [Integer] The identifier of the factor to enroll the user with.
      # @param display_name [String] A name for the users device.
      # @param number [String] The phone number of the user in E.164 format.
      #
      # @return [OTPDevice] MFA device
      #
      # @see {https://developers.onelogin.com/api-docs/1/multi-factor-authentication/enroll-factor Enroll an Authentication Factor documentation}
      def enroll_factor(user_id, factor_id, display_name, number)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          if factor_id.nil? || factor_id.to_s.empty?
            @error = '400'
            @error_description = "factor_id is required"
            @error_attribute = "factor_id"
            return
          end

          url = url_for(ENROLL_FACTOR_URL, user_id)

          data = {
            'factor_id'=> factor_id.to_i,
            'display_name'=> display_name,
            'number'=> number
          }

          response = self.class.post(
            url,
            :headers => authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data and json_data['data']
              return OneLogin::Api::Models::V1::OTPDevice.new(json_data['data'][0])
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Return a list of authentication factors registered to a particular user for multifactor authentication (MFA)
      #
      # @param user_id [Integer] The id of the user.
      #
      # @return [Array] OTPDevice List
      #
      # @see {https://developers.onelogin.com/api-docs/1/multi-factor-authentication/enrolled-factors Get Enrolled Authentication Factors documentation}
      def get_enrolled_factors(user_id)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          url = url_for(GET_ENROLLED_FACTORS_URL, user_id)

          response = self.class.get(
            url,
            :headers => authorized_headers
          )

          otp_devices = []
          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data and json_data['data'] and json_data['data']['otp_devices']
              json_data['data']['otp_devices'].each do |otp_device_data|
                otp_devices << OneLogin::Api::Models::V1::OTPDevice.new(otp_device_data)
              end
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
          return otp_devices
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Triggers an SMS or Push notification containing a One-Time Password (OTP)
      # that can be used to authenticate a user with the Verify Factor call.
      #
      # @param user_id [Integer] The id of the user.
      # @param device_id [Integer] The id of the MFA device.
      #
      # @return [FactorEnrollmentResponse] Info with User Id, Device Id, and OTP Device
      #
      # @see {https://developers.onelogin.com/api-docs/1/multi-factor-authentication/activate-factor Activate an Authentication Factor documentation}
      def activate_factor(user_id, device_id)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          if device_id.nil? || device_id.to_s.empty?
            @error = '400'
            @error_description = "device_id is required"
            @error_attribute = "device_id"
            return
          end

          url = url_for(ACTIVATE_FACTOR_URL, user_id, device_id)

          response = self.class.post(
            url,
            headers: authorized_headers
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data['data']
              return OneLogin::Api::Models::V1::FactorEnrollmentResponse.new(json_data['data'][0])
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Authenticates a one-time password (OTP) code provided by a multifactor authentication (MFA) device.
      #
      # @param user_id [Integer] The id of the user.
      # @param device_id [Integer] The id of the MFA device.
      # @param otp_token [String] OTP code provided by the device or SMS message sent to user.
      #                           When a device like OneLogin Protect that supports Push has
      #                           been used you do not need to provide the otp_token.
      # @param state_token [String] The state_token is returned after a successful request
      #                             to Enroll a Factor or Activate a Factor.
      #                             MUST be provided if the needs_trigger attribute from
      #                             the proceeding calls is set to true.
      #
      # @return [Boolean] True if Factor is verified
      #
      # @see {https://developers.onelogin.com/api-docs/1/multi-factor-authentication/verify-factor Verify an Authentication Factor documentation}
      def verify_factor(user_id, device_id, otp_token=nil, state_token=nil)
        clean_error
        prepare_token

        begin
          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          if device_id.nil? || device_id.to_s.empty?
            @error = '400'
            @error_description = "device_id is required"
            @error_attribute = "device_id"
            return
          end


          url = url_for(VERIFY_FACTOR_URL, user_id, device_id)

          data = {
            'user_id'=> user_id,
            'device_id'=> device_id
          }

          unless otp_token.nil? || otp_token.empty?
            data['otp_token'] = otp_token
          end

          unless state_token.nil? || state_token.empty?
            data['state_token'] = state_token
          end

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Remove an enrolled factor from a user.
      #
      # @param user_id [Integer] The id of the user.
      # @param device_id [Integer] The device_id of the MFA device.
      #
      # @return [Boolean] The result of the action
      #
      # @see {https://developers.onelogin.com/api-docs/1/multi-factor-authentication/remove-factor Remove a Factor documentation}
      def remove_factor(user_id, device_id)
        clean_error
        prepare_token

        begin

          if user_id.nil? || user_id.to_s.empty?
            @error = '400'
            @error_description = "user_id is required"
            @error_attribute = "user_id"
            return
          end

          if device_id.nil? || device_id.to_s.empty?
            @error = '400'
            @error_description = "device_id is required"
            @error_attribute = "device_id"
            return
          end

          url = url_for(REMOVE_FACTOR_URL, user_id, device_id)

          response = self.class.delete(
            url,
            :headers => authorized_headers
          )

          if response.code == 200
            return true
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
            return false
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      ########################
      # Invite Links Methods #
      ########################

      # Generates an invite link for a user that you have already created in your OneLogin account.
      #
      # @param email [String] Set to the email address of the user that you want to generate an invite link for.
      #
      # @return [String] the invitation link
      #
      # @see {https://developers.onelogin.com/api-docs/1/invite-links/generate-invite-link Generate Invite Link documentation}
      def generate_invite_link(email)
        clean_error
        prepare_token

        begin
          if email.nil? || email.to_s.empty?
            @error = '400'
            @error_description = "email is required"
            @error_attribute = "email"
            return
          end

          url = url_for(GENERATE_INVITE_LINK_URL)

          data = {
            'email'=> email
          }

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data['data']
              return json_data['data'][0]
            end
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Sends an invite link to a user that you have already created in your OneLogin account.
      #
      # @param email [String] Set to the email address of the user that you want to send an invite link for.
      # @param personal_email [String] (Optional) If you want to send the invite email to an email other than the
      #                                one provided in email, provide it here. The invite link will be
      #                                sent to this address instead.
      #
      # @return [String] the result of the operation
      #
      # @see {https://developers.onelogin.com/api-docs/1/invite-links/send-invite-link Send Invite Link documentation}
      def send_invite_link(email, personal_email=nil)
        clean_error
        prepare_token

        begin
          url = url_for(SEND_INVITE_LINK_URL)

          data = {
            'email'=> email
          }

          unless personal_email.nil? || personal_email.to_s.empty?
            data['personal_email'] = personal_email
          end

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 200
            return handle_operation_response(response)
          else
            @error = response.code.to_s
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Lists apps accessible by a OneLogin user.
      #
      # @param token [String] Provide your embedding token.
      # @param email [String] Provide the email of the user for which you want to return a list of embeddable apps.
      #
      # @return [Array] the embed apps
      #
      # @see {https://developers.onelogin.com/api-docs/1/embed-apps/get-apps-to-embed-for-a-user Get Apps to Embed for a User documentation}
      def get_embed_apps(token, email)
        clean_error

        begin
          response = self.class.get(
            EMBED_APP_URL,
            headers: {
              'User-Agent' => @user_agent
            },
            query: {
              token: token,
              email: email
            }
          )

          if response.code == 200 && !(response.body.nil? || response.body.empty?)
            return retrieve_apps_from_xml(response.body)
          else
            @error = response.code.to_s
            unless response.body.nil? || response.body.empty?
              @error_description = response.body
            end
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      def retrieve_apps_from_xml(xml_content)
        doc = Nokogiri::XML(xml_content) do |config|
          config.options = NOKOGIRI_OPTIONS
        end

        node_list = doc.xpath("/apps/app")
        attributes = ['id', 'icon', 'name', 'provisioned', 'extension_required', 'personal', 'login_id']
        apps = []
        node_list.each do |node|
          app_data = {}
          node.children.each do |children|
            if attributes.include? children.name
              app_data[children.name] = children.content
            end
          end
          apps << OneLogin::Api::Models::V1::EmbedApp.new(app_data)
        end

        apps
      end

      #####################
      # Privilege Methods #
      #####################

      # Gets a list of the Privileges created in an account.
      #
      # @return [Array] list of privilege objects
      #
      # @see {https://developers.onelogin.com/api-docs/1/privileges/list-privileges List Privileges documentation}
      def get_privileges()
        clean_error
        prepare_token

        begin

          url = url_for(LIST_PRIVILEGES_URL)

          privileges = []
          response = self.class.get(
            url,
            headers: authorized_headers
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if !json_data.empty?
              json_data.each do |data|
                privileges << OneLogin::Api::Models::V1::Privilege.new(data)
              end
            end
            return privileges
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Creates a Privilege
      #
      # @param name [string] The name of the privilege.
      # @param version [string] The version for the privilege schema. Set to 2018-05-18.
      # @param statements [Array] A list of statements. Statement object or a dict with the keys Effect, Action and Scope
      #
      # @return [Privilege] the created privilege
      #
      # @see {https://developers.onelogin.com/api-docs/1/privileges/create-privilege Create Privilege documentation}
      def create_privilege(name, version, statements)
        clean_error
        prepare_token

        begin
          url = url_for(CREATE_PRIVILEGE_URL)

          statement_data = []
          for statement in statements
            if statement.instance_of?(OneLogin::Api::Models::V1::Statement)
              statement_data << {
               'Effect' => statement.effect,
               'Action' => statement.actions,
               'Scope' => statement.scopes
              }
            elsif statement.instance_of?(Hash) && statement.has_key?('Effect') && statement.has_key?('Action') && statement.has_key?('Scope')
              statement_data << statement
            else
              @error = 400.to_s
              @error_description = "statements is invalid. Provide a list of statements. The statement should be an Statement object or dict with the keys Effect, Action and Scope"
              return
            end
          end

          privilege_data = {
            'name' => name,
            'privilege' => {
              'Version'=> version,
              'Statement' => statement_data
            }
          }

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: privilege_data.to_json
          )

          if response.code == 201
            json_data = JSON.parse(response.body)
            if json_data && json_data.has_key?('id')
              return OneLogin::Api::Models::V1::Privilege.new(json_data['id'], name, version, statements)
            end
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Get a Privilege.
      #
      # @param privilege_id [string] Id of the privilege
      #
      # @return [Privilege] the privilege identified by the id
      #
      # @see {https://developers.onelogin.com/api-docs/1/privileges/get-privilege Get Privilege documentation}
      def get_privilege(privilege_id)
        clean_error
        prepare_token

        begin
          if privilege_id.nil? || privilege_id.to_s.empty?
            @error = '400'
            @error_description = "privilege_id is required"
            @error_attribute = "privilege_id"
            return
          end

          url = url_for(GET_PRIVILEGE_URL, privilege_id)

          response = self.class.get(
            url,
            headers: authorized_headers
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data.has_key?('id')
              return OneLogin::Api::Models::V1::Privilege.new(json_data)
            end
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Updates a Privilege
      #
      # @param privilege_id [string] The id of the privilege to be updated.
      # @param name [string] The name of the privilege.
      # @param version [string] The version for the privilege schema. Set to 2018-05-18.
      # @param statements [Array] A list of statements. Statement object or a dict with the keys Effect, Action and Scope
      #
      #
      # @return [Privilege] the modified privilege
      #
      # @see {https://developers.onelogin.com/api-docs/1/privileges/update-privilege Update Privilege documentation}
      def update_privilege(privilege_id, name, version, statements)
        clean_error
        prepare_token

        begin
          if privilege_id.nil? || privilege_id.to_s.empty?
            @error = '400'
            @error_description = "privilege_id is required"
            @error_attribute = "privilege_id"
            return
          end

          url = url_for(UPDATE_PRIVILEGE_URL, privilege_id)

          statement_data = []
          for statement in statements
            if statement.instance_of?(OneLogin::Api::Models::V1::Statement)
              statement_data << {
               'Effect' => statement.effect,
               'Action' => statement.actions,
               'Scope' => statement.scopes
              }
            elsif statement.instance_of?(Hash) && statement.has_key?('Effect') && statement.has_key?('Action') && statement.has_key?('Scope')
              statement_data << statement
            else
              @error = 400.to_s
              @error_description = "statements is invalid. Provide a list of statements. The statement should be an Statement object or dict with the keys Effect, Action and Scope"
              return
            end
          end

          privilege_data = {
            'name' => name,
            'privilege' => {
              'Version'=> version,
              'Statement' => statement_data
            }
          }

          response = self.class.put(
            url,
            headers: authorized_headers,
            body: privilege_data.to_json
          )

          if response.code == 200
            json_data = JSON.parse(response.body)
            if json_data && json_data.has_key?('id')
              return OneLogin::Api::Models::V1::Privilege.new(json_data['id'], name, version, statements)
            end
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Deletes a Privilege
      #
      # @param privilege_id [string] Id of the privilege to be removed.
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/privileges/delete-privilege Delete Privilege documentation}
      def delete_privilege(privilege_id)
        clean_error
        prepare_token

        begin
          if privilege_id.nil? || privilege_id.to_s.empty?
            @error = '400'
            @error_description = "privilege_id is required"
            @error_attribute = "privilege_id"
            return
          end

          url = url_for(DELETE_PRIVILEGE_URL, privilege_id)

          response = self.class.delete(
            url,
            headers: authorized_headers
          )

          if response.code == 204
            return handle_operation_response(response)
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Gets a list of the roles assigned to a privilege.
      #
      # @param privilege_id [string] Id of the privilege.
      #
      # @return [Array] list of Role Id
      #
      # @see {https://developers.onelogin.com/api-docs/1/privileges/get-roles Get Assigned Roles documentation}
      def get_roles_assigned_to_privilege(privilege_id)
        clean_error
        prepare_token

        begin
          if privilege_id.nil? || privilege_id.to_s.empty?
            @error = '400'
            @error_description = "privilege_id is required"
            @error_attribute = "privilege_id"
            return
          end

          options = {
            headers: authorized_headers,
            max_results: @max_results,
            container: 'roles'
          }

          return Cursor.new(self, url_for(GET_ROLES_ASSIGNED_TO_PRIVILEGE_URL, privilege_id), options)

        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Assign one or more roles to a privilege.
      #
      # @param privilege_id [string] Id of the privilege.
      # @param role_ids [Array] Ids of the roles to be added.
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/privileges/assign-role Assign Roles documentation}
      def assign_roles_to_privilege(privilege_id, role_ids)
        clean_error
        prepare_token

        begin
          if privilege_id.nil? || privilege_id.to_s.empty?
            @error = '400'
            @error_description = "privilege_id is required"
            @error_attribute = "privilege_id"
            return
          end

          url = url_for(ASSIGN_ROLES_TO_PRIVILEGE_URL, privilege_id)

          data = {
            'roles' => role_ids
          }

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 201
            return handle_operation_response(response)
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)

          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Removes one role from the privilege.
      #
      # @param privilege_id [string] Id of the privilege.
      # @param role_id [Integer] Id of the role to be removed.
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/privileges/remove-role Remove Role documentation}
      def remove_role_from_privilege(privilege_id, role_id)
        clean_error
        prepare_token

        begin
          if privilege_id.nil? || privilege_id.to_s.empty?
            @error = '400'
            @error_description = "privilege_id is required"
            @error_attribute = "privilege_id"
            return
          end

          url = url_for(REMOVE_ROLE_FROM_PRIVILEGE_URL, privilege_id, role_id)

          response = self.class.delete(
            url,
            headers: authorized_headers
          )

          if response.code == 204
            return true
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Gets a list of the users assigned to a privilege.
      #
      # @param privilege_id [string] Id of the privilege.
      #
      # @return [Array] list of User Id
      #
      # @see {https://developers.onelogin.com/api-docs/1/privileges/get-users Get Assigned Users documentation}
      def get_users_assigned_to_privilege(privilege_id)
        clean_error
        prepare_token

        begin
          if privilege_id.nil? || privilege_id.to_s.empty?
            @error = '400'
            @error_description = "privilege_id is required"
            @error_attribute = "privilege_id"
            return
          end

          options = {
            headers: authorized_headers,
            max_results: @max_results,
            container: 'users'
          }

          return Cursor.new(self, url_for(GET_USERS_ASSIGNED_TO_PRIVILEGE_URL, privilege_id), options)

        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        nil
      end

      # Assign one or more users to a privilege.
      #
      # @param privilege_id [string] Id of the privilege.
      # @param user_ids [Array] Ids of the users to be added.
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/privileges/assign-users Assign Users documentation}
      def assign_users_to_privilege(privilege_id, user_ids)
        clean_error
        prepare_token

        begin
          if privilege_id.nil? || privilege_id.to_s.empty?
            @error = '400'
            @error_description = "privilege_id is required"
            @error_attribute = "privilege_id"
            return
          end

          url = url_for(ASSIGN_USERS_TO_PRIVILEGE_URL, privilege_id)

          data = {
            'users' => user_ids
          }

          response = self.class.post(
            url,
            headers: authorized_headers,
            body: data.to_json
          )

          if response.code == 201
            return handle_operation_response(response)
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

      # Removes one user from the privilege.
      #
      # @param privilege_id [string] Id of the privilege.
      # @param user_id [Integer] Id of the user to be removed.
      #
      # @return [Boolean] if the action succeed
      #
      # @see {https://developers.onelogin.com/api-docs/1/privileges/remove-user Remove User documentation}
      def remove_user_from_privilege(privilege_id, user_id)
        clean_error
        prepare_token

        begin
          if privilege_id.nil? || privilege_id.to_s.empty?
            @error = '400'
            @error_description = "privilege_id is required"
            @error_attribute = "privilege_id"
            return
          end

          url = url_for(REMOVE_USER_FROM_PRIVILEGE_URL, privilege_id, user_id)

          response = self.class.delete(
            url,
            headers: authorized_headers
          )

          if response.code == 204
            return true
          else
            @error = extract_status_code_from_response(response)
            @error_description = extract_error_message_from_response(response)
          end
        rescue Exception => e
          @error = '500'
          @error_description = e.message
        end

        false
      end

    end
  end
end
