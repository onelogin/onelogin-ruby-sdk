require 'onelogin/api/util/constants'
require 'onelogin/api/util/url_builder'
require 'onelogin/api/util/parser'

module OneLogin
  module Api
    module Util
      include OneLogin::Api::Util::Constants
      include OneLogin::Api::Util::UrlBuilder
      include OneLogin::Api::Util::Parser
    end
  end
end