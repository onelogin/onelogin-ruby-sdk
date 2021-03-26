require 'onelogin/api/util/utils.rb'
require 'onelogin/api/models/base.rb'

module OneLogin
  module Api
    module Models

      class App

        attr_accessor :id, :name, :icon, :provisioned
        attr_accessor :extension, :login_id, :personal
        attr_accessor :connector, :visible, :provisioning
        attr_accessor :provisioning_status

        def initialize(data)
          @id = str2int(data['id', nil])
          @name = data['name', '']
          if data.keys.include?('icon') 
            @icon = data['icon', nil]
          else
            @icon = data['icon_url', nil]  
          @connector_id = str2int(data['connector_id', nil])
          end
          if data.keys.include?('extension')
            @extension = str2bool(data['extension', nil])
          end
          if data.keys.include?('visible')
            @visible = str2bool(data['visible', nil])
          end
          if data.keys.include?('login_id')
            @login_id = str2bool(data['login_id', nil])
          end  
          if data.keys.include?('personal')
            @personal = str2bool(data['personal', nil])
          end
          if data.keys.include?('provisioned')
            @provisioned = str2bool(data['provisioned', nil]) 
          end     
          if data.keys.include?('provisioning')
            @provisioning = str2bool(data['provisioning', nil])
          end
          if data.keys.include?('provisioning_status')
            @provisioning_status = str2bool(data['provisioning_status', nil])  
            @provisioning_state = str2bool(data['provisioning_state', nil]) 
            @provisioning_enabled = str2bool(data['provisioning_enabled', nil]) 
          end            

        end
      end
    end
  end
end
