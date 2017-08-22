module OneLogin
  module Api
    module Models

      class Role

        attr_accessor :id, :name

        def initialize(data)
          @id = data['id']
          @name = data['name'].to_s
        end
      end
    end
  end
end
