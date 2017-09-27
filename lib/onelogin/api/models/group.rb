module OneLogin
  module Api
    module Models

      class Group

        attr_accessor :id, :name, :reference

        def initialize(data)
          @id = data['id']
          @name = data['name'].to_s
          @reference = data['reference'].to_s
        end
      end
    end
  end
end
