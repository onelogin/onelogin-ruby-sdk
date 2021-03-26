require 'onelogin/api/util/utils.rb'
require 'onelogin/api/models/base.rb'

module OneLogin
  module Api
    module Models

      class AssignedBase
        include Base

        attr_accessor :id, :name, :email, :username
        attr_accessor :assigned, :added_by

        def initialize(data)
            @id = str2int(data['id',nil])
            @name = str2int(data['name',nil])
            @email = str2int(data['email',nil])
            @username= str2int(data['username',nil])
            @assigned = str2int(data['assigned',nil])
            @added_by = str2int(data['added_by',nil])
        end

        def get_added_by
            return @added_by
        end
      end  
    end
end
end