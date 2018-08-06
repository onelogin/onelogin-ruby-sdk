require 'onelogin/api/util/constants'
require 'onelogin/api/util/url_builder'

module OneLogin
  module Api
    module Util
      include OneLogin::Api::Util::Constants
      include OneLogin::Api::Util::UrlBuilder

      def extract_error_message_from_response(response)
        message = ''
        content = JSON.parse(response.body)
        if content && content.has_key?('status')
          status = content['status']
          if status.has_key?('message')
            message = status['message']
          elsif status.has_key?('type')
            message = status['type']
          end
        end
        message
      end
    end
  end
end