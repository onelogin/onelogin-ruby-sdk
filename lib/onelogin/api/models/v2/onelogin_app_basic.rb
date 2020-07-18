module OneLogin
  module Api
    module Models
      module V2

        class OneLoginAppBasic

          attr_accessor :name, :visible,
                        :description

          attr_reader :created_at, :updated_at,
                      :connector_id, :auth_method, :id

          def initialize(data)
            @id = data['id']? data['id'].to_i : nil
            @name = data['name']
            @description = data['description']
            @auth_method = data['auth_method']
            @connector_id = data['connector_id']? data['connector_id'].to_i : nil
            @visible = data['visible']
            @created_at = data['created_at']
            @updated_at = data['updated_at']

          end

          def get_auth_method_name
            auth_method_name = nil
            case @auth_method
            when 0
              auth_method_name = "PASSWORD"
            when 1
              auth_method_name = "OPENID"
            when 2
              auth_method_name = "SAML"
            when 3
              auth_method_name = "API"
            when 4
              auth_method_name = "GOOGLE"
            when 6
              auth_method_name = "BASIC_AUTH"
            when 7
              auth_method_name = "WSFED"
            when 8
              auth_method_name = "OIDC"
            end

            auth_method_name
          end
        end
      end
    end
  end
end
