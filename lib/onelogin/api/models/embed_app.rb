module OneLogin
  module Api
    module Models

      class EmbedApp

        attr_accessor :id, :name, :icon, :provisioned, :extension_required, :login_id, :personal

        def initialize(data)
          @data = data

          @id = data['id'].to_i
          @name = data['name'].to_s
          @icon = data['icon']
          @provisioned = data['provisioned'].to_i
          @extension_required = truthy?('extension_required')
          @login_id = data['login_id'].to_i
          @personal = truthy?('personal')
        end

        private

        def truthy?(attribute_name)
          return false unless @data[attribute_name]

          ['yes', 'true', '1'].include? @data[attribute_name].to_s.downcase
        end
      end
    end
  end
end