module OneLogin
  module Api
    module Models

      class Device

        attr_accessor :id, :type

        def initialize(data)
          @id = data['device_id']
          @type = data['device_type'].to_s
        end
      end
    end
  end
end
