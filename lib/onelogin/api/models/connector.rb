require 'onelogin/api/util/utils.rb'

module OneLogin
  module Api
    module Models

      class ConnectorBasic

        attr_accessor :id, :name, :auth_method
        attr_accessor :icon_url, :allows_new_parameters

        def initialize(data)
         
          @id = str2int(data['id'])
          @name = data['name']
          @icon_url = data['icon_url']
          @auth_method = str2int(data['auth_method'])
          @allows_new_parameters = str2bool(data['allows_new_parameters'])
        end
      end
    end
  end
end
