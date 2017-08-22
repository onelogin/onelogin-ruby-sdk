module OneLogin
  module Api
    module Models

      class UserData

        attr_accessor :id, :external_id, :email, :username, :firstname, :lastname, :distinguished_name,
                      :phone, :company, :department, :status, :member_of, :samaccountname, :userprincipalname,
                      :openid_name, :locale_code, :directory_id, :manager_ad_id, :trusted_idp_id
      end
    end
  end
end
