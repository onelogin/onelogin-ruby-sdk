module OneLogin
  module Api
    module Models

      class EventType

        attr_accessor :id, :name, :description

        def initialize(data)
          @id = data['id']
          @name = data['name'].to_s
          @description = data['description'].to_s
        end
      end
    end
  end
end
