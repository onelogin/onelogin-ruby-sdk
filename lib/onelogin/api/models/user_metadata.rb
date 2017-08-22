module OneLogin
  module Api
    module Models

      class UserMetadata

        attr_accessor :id, :activated_at, :created_at, :updated_at, :password_changed_at,
                      :invitation_sent_at, :invalid_login_attempts, :last_login, :locked_until,
                      :comment
      end
    end
  end
end