module OneLogin
  module Api
    module Models

      class AuthFactor

        attr_accessor :id, :name

        def initialize(data)
          @id = data['factor_id']
          @name = data['name'].to_s
        end
      end
    end
  end
end