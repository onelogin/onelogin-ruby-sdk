module OneLogin
  module Api
    module Models
      module V1

        class App

          attr_accessor :id, :name, :icon, :provisioned
          attr_accessor :extension, :login_id, :personal

          def initialize(data)
            @id = data['id']
            @name = data['name']
            @icon = data['icon']
            @provisioned = data['provisioned']
            @extension = data['extension']
            @login_id = data['login_id']
            @personal = data['personal']
          end
        end
      end
    end
  end
end
