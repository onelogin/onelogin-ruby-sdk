module OneLogin
  module Api
    module Models

      class App

        attr_accessor :id, :name, :icon, :provisioned, :extension_required, :login_id, :personal

        def initialize(data)
          @id = data['id']
          @name = data['name'].to_s
          @icon = data['icon']
          @provisioned = data['provisioned'].to_i
          @extension_required = if ["yes", "true", "1"].include? data['extension_required'].downcase then true else false end
          @login_id = data['login_id'].to_i
          @personal = if ["yes", "true", "1"].include? data['personal'].downcase then true else false end
        end
      end
    end
  end
end
