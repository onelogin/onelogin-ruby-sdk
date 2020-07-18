module OneLogin
  module Api
    module Models
      module V1

        class Statement

          attr_accessor :effect, :actions, :scopes

          def initialize(*args)
            if args.length == 1
              self.from_data(args[0])
            else
              self.from_values(args[0], args[1], args[2])
            end
          end

          def from_data(data)
            @effect = data['Effect']? data['Effect'] : "Allow"
            @actions = data['Action']? data['Action'] : []
            @scopes = data['Scope']? data['Scope'] : []
          end

          def from_values(effect, actions, scopes)
            @effect = effect
            @actions = actions
            @scopes = scopes
          end

          def get_valid_actions
            return 
              Constants.VALID_ACTIONS
          end
        end
      end
    end
  end
end
