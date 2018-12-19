require 'onelogin/api/models/statement'

module OneLogin
  module Api
    module Models

      class Privilege

        attr_accessor :id, :name, :version, :statements

        def initialize(*args)
          if args.length == 1
            self.from_data(args[0])
          else
            self.from_values(args[0],args[1], args[2], args[3])
          end
        end

        def from_data(data)
          @id = data['id']
          @name = data['name']
          @version = data['privilege']['Version']
          statements_data = data['privilege']['Statement']
          @statements = []
          for statement_data in statements_data
             @statements << Statement.new(statement_data)
          end
        end

        def from_values(id, name, version, statements)
          @id = id
          @name = name
          @version = version
          @statements = []
          for statement in statements
            if statement.instance_of?(Statement)
              @statements << statement
            elsif statement.instance_of?(Hash) && statement.has_key?('Effect') && statement.has_key?('Action') && statement.has_key?('Scope')
              @statements << Statement.new(statement['Effect'], statement['Action'], statement['Scope'])
            end
          end
        end

        def get_valid_actions
          return 
            Constants.VALID_ACTIONS
        end
      end
    end
  end
end
