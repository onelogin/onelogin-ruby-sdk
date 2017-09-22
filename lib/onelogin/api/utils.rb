require 'onelogin/api/utils/constants'
require 'onelogin/api/utils/url_builder'

module OneLogin
  module Api
    module Utils
      include OneLogin::Api::Util::Constants
      include OneLogin::Api::Utils::UrlBuilder
    end
  end
end