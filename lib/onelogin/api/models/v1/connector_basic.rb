module OneLogin
  module Api
    module Models
      module V1

        class ConnectorBasic

          attr_accessor :id, :name, :auth_method
          attr_accessor :icon_url, :allows_new_parameters

          def initialize(data)
            @id = data['id']
            @name = data['name']
            @icon_url = data['icon_url']
            @auth_method = data['auth_method']
            @allows_new_parameters = data['allows_new_parameters']
          end
        end
      end
    end
  end
end
