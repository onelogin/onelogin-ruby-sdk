module OneLogin
  module Api
    module Models

      class Event

        attr_accessor :id, :created_at, :account_id, :user_id, :user_name, :event_type_id,
                      :notes, :ipaddr, :actor_user_id, :actor_user_name, :assuming_acting_user_id,
                      :role_id, :role_name, :app_id, :app_name, :group_id, :group_name, :otp_device_id,
                      :otp_device_name, :policy_id, :policy_name, :actor_system, :custom_message,
                      :operation_name, :directory_sync_run_id, :directory_id, :resolution, :client_id,
                      :resource_type_id, :error_description

        def initialize(data)
          @id = data['id']
          @created_at = data['created_at']? Time.iso8601(data['created_at']) : nil
          @account_id = data['account_id']
          @user_id = data['user_id']
          @user_name = data['user_name'].to_s
          @event_type_id = data['event_type_id']
          @notes = data['notes'].to_s
          @ipaddr = data['ipaddr'].to_s
          @actor_user_id = data['actor_user_id']
          @actor_user_name = data['actor_user_name'].to_s
          @assuming_acting_user_id = data['assuming_acting_user_id']
          @role_id = data['role_id']
          @role_name = data['role_name'].to_s
          @app_id = data['app_id']
          @app_name = data['app_name'].to_s
          @group_id = data['group_id']
          @group_name = data['group_name'].to_s
          @otp_device_id = data['otp_device_id']
          @otp_device_name = data['otp_device_name'].to_s
          @policy_id = data['policy_id']
          @policy_name = data['policy_name'].to_s
          @actor_system = data['actor_system'].to_s
          @custom_message = data['custom_message'].to_s
          @operation_name = data['operation_name'].to_s
          @directory_sync_run_id = data['directory_sync_run_id']
          @directory_id = data['directory_id']
          @resolution = data['resolution'].to_s
          @client_id = data['client_id']
          @resource_type_id = data['resource_type_id']
          @error_description = data['error_description'].to_s
          @proxy_ip = data['proxy_ip'].to_s
          @risk_score = data['risk_score']
          @risk_reasons = data['risk_reasons'].to_s
          @risk_cookie_id = data['risk_cookie_id']
          @browser_fingerprint = data['browser_fingerprint']
        end
      end
    end
  end
end
