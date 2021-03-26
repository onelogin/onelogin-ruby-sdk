require 'onelogin/api/util/utils.rb'
module OneLogin
  module Api
    module Models

      class Device

        attr_accessor :id, :type, :duo_api_hostname, :duo_sig_request

        def initialize(data)
          @id = data['device_id']
          @type = data['device_type'].to_s
          @duo_api_hostname = data['duo_api_hostname']
          @duo_sig_request = data['duo_sig_request']
        end
      end
    end
  end
end
