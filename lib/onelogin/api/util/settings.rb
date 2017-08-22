require 'yaml'

module OneLogin
  module Api
    module Util

      # Settings class of the OneLogin's Ruby SDK.
      #
      # Handles the settings of the OneLogin's Python SDK. 
      #
      class Settings

        ONELOGIN_PROPERTIES_FILE = "onelogin.sdk.ini"
        CLIENT_ID_KEY = "onelogin.sdk.client_id"
        CLIENT_SECRET_KEY = "onelogin.sdk.client_secret"
        INSTANCE = "onelogin.sdk.instance"

        attr_accessor :client_id, :client_secret, :instance

        # Creates a new instance of Settings.
        #
        # @param path [String] Path where the sdk config file is located.
        #
        def initialize(path=nil)
          if path.nil? || path.empty?
            path = File.dirname(File.expand_path(__FILE__))
          end

          filename = File.join(path, ONELOGIN_PROPERTIES_FILE)

          if !File.file?(filename)
            raise Exception("OneLogin settings file not found at #{filename}")
          end

          settings = YAML::load_file(filename)
          @client_id = settings[CLIENT_ID_KEY]
          @client_secret = settings[CLIENT_SECRET_KEY]
          @instance = settings[INSTANCE]
        end

        # Build the URL of the API endpoint
        #
        # @param base [String] Base of the endpoint
        # @param obj_id [String, nil] Id of the referenced object
        #
        def get_url(base, obj_id=nil)
          if obj_id.nil? || obj_id.to_s.empty?
            base % [@instance]
          else
            base % [@instance, obj_id]
          end
        end
      end
    end
  end
end
