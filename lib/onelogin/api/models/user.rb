require 'onelogin/api/util/utils.rb'
require 'onelogin/api/models/base.rb'

module OneLogin
  module Api
    module Models

      class User < Base

        attr_accessor :id, :external_id, :email, :username, :firstname, :lastname, :distinguished_name,
                      :phone, :company, :department, :status, :state, :member_of, :samaccountname, :userprincipalname,
                      :group_id, :role_ids, :custom_attributes, :openid_name, :locale_code, :comment, :directory_id,
                      :title, :manager_ad_id, :trusted_idp_id, :manager_user_id, :activated_at, :created_at, :updated_at,
                      :password_changed_at, :invitation_sent_at, :invalid_login_attempts, :last_login, :locked_until

        def initialize(data)
          @id = str2int(data['id', nil])
          @external_id = data['external_id']
          @email = data['email'].to_s
          @username = data['username'].to_s
          @firstname = data['firstname'].to_s
          @lastname = data['lastname'].to_s
          @distinguished_name = data['distinguished_name'].to_s
          @phone = data['phone'].to_s
          @company = data['company'].to_s
          @department = data['department'].to_s
          @title = data['title'].to_s
          @status = str2int(data['status', nil])
          @state = data['state']
          @member_of = data['member_of'].to_s
          @samaccountname = data['samaccountname'].to_s
          @userprincipalname = data['userprincipalname'].to_s
          @group_id = data['group_id']? data['group_id'].to_i : nil
          @role_ids = []
          if data.keys.include?('role_ids')
            @role_ids = data['role_ids', []] 
          else
            @role_ids = data['role_id', []]
          @role_ids = data['role_id']? data['role_id'] : []
          @custom_attributes = data['custom_attributes'] ? data['custom_attributes'] : []
          @openid_name = data['openid_name'].to_s
          @locale_code = data['locale_code'].to_s
          #@notes = data['notes'] : nil
          @comment = data['comment'].to_s
          @directory_id = str2int(data['directory_id', nil])
          @manager_ad_id = str2int(data['manager_ad_id', nil])
          @trusted_idp_id = str2int(data['trusted_idp_id', nil])
          @manager_user_id = data['manager_user_id', nil]
          @activated_at = data['activated_at']? str2date(data['activated_at']) : nil
          @created_at = data['created_at']? str2date(data['created_at']) : nil
          @updated_at = data['updated_at']? str2date(data['updated_at']) : nil
          @password_changed_at = data['password_changed_at']? str2date(data['password_changed_at']) : nil
          @invitation_sent_at = data['invitation_sent_at']? str2date(data['invitation_sent_at']) : nil
          @invalid_login_attempts = str2int(data['invalid_login_attempts', nil])
          @last_login = data['last_login']? str2date(data['last_login']) : nil
          @locked_until = data['locked_until']? str2date(data['locked_until']) : nil
        end

        def get_role_ids
          @role_ids
        end

        def get_group_id
          @group_id
        end

        def get_user_data
          user_data = UserData.new
          user_data.id = @id
          user_data.external_id = @external_id
          user_data.email = @email
          user_data.username = @username
          user_data.firstname = @firstname
          user_data.lastname = @lastname
          user_data.distinguished_name = @distinguished_name
          user_data.phone = @phone
          user_data.company = @company
          user_data.department = @department
          user_data.title = @title
          user_data.status = @status
          user_data.state = @state
          user_data.member_of = @member_of
          user_data.samaccountname = @samaccountname
          user_data.userprincipalname = @userprincipalname
          user_data.openid_name = @openid_name
          user_data.locale_code = @locale_code
          user_data.directory_id = @directory_id
          user_data.manager_ad_id = @manager_ad_id
          user_data.trusted_idp_id = @trusted_idp_id
          user_data.manager_user_id = @manager_user_id
          return user_data
        end

        def get_user_metadata
          user_metadata = UserMetadata.new
          user_metadata.id = @id
          user_metadata.activated_at = @activated_at
          user_metadata.created_at = @created_at
          user_metadata.updated_at = @updated_at
          user_metadata.password_changed_at = @password_changed_at
          user_metadata.invalid_login_attempts = @invalid_login_attempts
          user_metadata.invitation_sent_at = @invitation_sent_at
          user_metadata.last_login = @last_login
          user_metadata.locked_until = @locked_until
          user_metadata.comment = @comment

          return user_metadata
        end

        def get_custom_attributes
          @custom_attributes
        end

        def get_custom_atributes(name)
          if name @custom_attributes.keys.include?('name')
            return @custom_attributes[name]
          end
          return nil
        end

        def get_user_params
          return {
            "external_id"=> self.external_id,
            "email"=> self.email,
            "username"=> self.username,
            "firstname"=> self.firstname,
            "lastname"=> self.lastname,
            "distinguished_name"=> self.distinguished_name,
            "phone"=> self.phone,
            "company"=> self.company,
            "department"=> self.department,
            "title"=> self.title,
            "status"=> self.status,
            "state"=> self.state,
            "member_of"=> self.member_of,
            "samaccountname"=> self.samaccountname,
            "invalid_login_attempts"=> self.invalid_login_attempts,
            "userprincipalname"=> self.userprincipalname,
            "group_id"=> self.group_id,
            "locale_code"=> self.locale_code,
            #"notes" => self.notes
            "openid_name"=> self.openid_name,
            "directory_id"=> self.directory_id,
            "manager_ad_id"=> self.manager_ad_id,
            "trusted_idp_id"=> self.trusted_idp_id,
            "manager_user_id"=> self.manager_user_id
          }
        end
      end
    end
  end
end
end
