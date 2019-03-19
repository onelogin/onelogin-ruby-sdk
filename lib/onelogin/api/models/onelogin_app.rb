module OneLogin
  module Api
    module Models

      class OneLoginApp

        attr_accessor :id, :connector_id, :name, :extension
        attr_accessor :icon, :visible, :provisioning

        def initialize(data)
          @id = data['id']
          @connector_id = data['connector_id']
          @name = data['name']
          @extension = data['extension']
          @icon = data['icon']
          @visible = data['visible']
          @provisioning = data['provisioning']
        end
      end
    end
  end
end
