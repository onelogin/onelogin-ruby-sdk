module OneLogin
  module Api
    module Models
      module V1

        class RateLimit

          attr_accessor :limit, :remaining, :reset

          def initialize(data)
            @limit = data['X-RateLimit-Limit']
            @remaining = data['X-RateLimit-Remaining']
            @reset = data['X-RateLimit-Reset']
          end
        end
      end
    end
  end
end
