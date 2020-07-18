module OneLogin
  module Api
    module Models
      module V1

        class UserBasic
          
          attr_accessor :id,
                        :email,
                        :username,
                        :firstname,
                        :lastname

          def initialize(data)
            @id = data['id'].to_i
            @email = data['email'].to_s
            @username = data['username'].to_s
            @firstname = data['firstname'].to_s
            @lastname = data['lastname'].to_s
          end
        end
      end
    end
  end
end
