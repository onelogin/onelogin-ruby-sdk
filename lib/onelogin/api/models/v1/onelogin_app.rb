module OneLogin
  module Api
    module Models
      module V1

        class OneLoginApp

          attr_accessor :name, :visible, :policy_id, :is_available,
                        :parameters, :allow_assumed_signin,
                        :configuration, :notes, :description


          attr_reader :created_at, :updated_at, :icon, :provisioning,
                      :connector_id, :sso, :auth_method, :id, :tab_id

          def initialize(data)
            @name = data['name']
            @visible = data['visible']
            @policy_id = data['policy_id']? data['policy_id'].to_i : nil
            @parameters = data['parameters']
            @allow_assumed_signin = data['allow_assumed_signin']
            @configuration = data['configuration']
            @notes = data['notes']
            @description = data['description']

            @created_at = data['created_at']
            @updated_at = data['updated_at']
            @icon = data['icon_url']
            @provisioning = data['provisioning']
            @connector_id = data['connector_id']? data['connector_id'].to_i : nil
            @sso = data['sso']
            @auth_method = data['auth_method']
            @tab_id = data['tab_id']? data['tab_id'].to_i : nil
            @id = data['id']? data['id'].to_i : nil
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
