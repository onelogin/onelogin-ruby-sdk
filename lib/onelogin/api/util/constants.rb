module OneLogin
  module Api
    module Util
      # Constants class of the OneLogin's Ruby SDK.
      #
      # This class defines all the constants that will be used
      # in the OneLogin's Ruby SDK.
      #
      module Constants
        # OAuth2 Tokens URLs
        TOKEN_REQUEST_URL = "https://api.%s.onelogin.com/auth/oauth2/v2/token"
        TOKEN_REFRESH_URL = "https://api.%s.onelogin.com/auth/oauth2/v2/token"
        TOKEN_REVOKE_URL = "https://api.%s.onelogin.com/auth/oauth2/revoke"
        GET_RATE_URL = "https://api.%s.onelogin.com/auth/rate_limit"

        # User URLs
        GET_USERS_URL = "https://api.%s.onelogin.com/api/2/users"
        GET_USER_URL = "https://api.%s.onelogin.com/api/2/users/%s"
        GET_APPS_FOR_USER_URL = "https://api.%s.onelogin.com/api/2/users/%s/apps"
        GET_ROLES_FOR_USER_URL = "https://api.%s.onelogin.com/api/1/users/%s/roles"
        CREATE_USER_URL = "https://api.%s.onelogin.com/api/2/users"
        SESSION_LOGIN_TOKEN_URL = "https://api.%s.onelogin.com/api/1/login/auth"
        GET_TOKEN_VERIFY_FACTOR = "https://api.%s.onelogin.com/api/1/login/verify_factor"
        UPDATE_USER_URL = "https://api.%s.onelogin.com/api/2/users/%s"
        DELETE_USER_URL = "https://api.%s.onelogin.com/api/2/users/%s"
        ADD_ROLE_TO_USER_URL = "https://api.%s.onelogin.com/api/1/users/%s/add_roles"
        DELETE_ROLE_TO_USER_URL = "https://api.%s.onelogin.com/api/1/users/%s/remove_roles"
        SET_PW_CLEARTEXT = "https://api.%s.onelogin.com/api/1/users/set_password_clear_text/%s"
        SET_PW_SALT = "https://api.%s.onelogin.com/api/1/users/set_password_using_salt/%s"
        SET_CUSTOM_ATTRIBUTE_TO_USER_URL = "https://api.%s.onelogin.com/api/1/users/%s/set_custom_attributes"
        SET_USER_STATE_URL = "https://api.%s.onelogin.com/api/1/users/%s/set_state"
        LOG_USER_OUT_URL = "https://api.%s.onelogin.com/api/1/users/%s/logout"
        LOCK_USER_URL = "https://api.%s.onelogin.com/api/1/users/%s/lock_user"

        #Custom Attribute URLS
        GET_CUSTOM_ATTRIBUTES_URL = "https://api.%s.onelogin.com/api/2/users/custom_attributes"
        GET_CUSTOM_ATTRIBUTE = "https://api.%s.onelogin.com/api/2/users/custom_attributes/%s"
        CREATE_CUSTOM_ATTRIBUTE = "https://api.%s.onelogin.com/api/2/users/custom_attributes"
        UPDATE_CUSTOM_ATTRIBUTE = "https://api.%s.onelogin.com/api/2/users/custom_attributes/%s"
        DELETE_CUSTOM_ATTRIBUTE = "https://api.%s.onelogin.com/api/2/users/custom_attributes/%s"

        # Connectors URL
        GET_CONNECTORS_URL = "https://api.%s.onelogin.com/api/2/connectors"
        #GET_CONNECTOR_URL = "https://api.%s.onelogin.com/api/2/connectors/%s"

        # Apps URL

        # V1
        GET_APPS_URL_V1 = "https://api.%s.onelogin.com/api/1/apps"

        # V2
        GET_APPS_URL = "https://api.%s.onelogin.com/api/2/apps"
        CREATE_APP_URL = "https://api.%s.onelogin.com/api/2/apps"
        GET_APP_URL = "https://api.%s.onelogin.com/api/2/apps/%s"
        UPDATE_APP_URL = "https://api.%s.onelogin.com/api/2/apps/%s"
        DELETE_APP_URL = "https://api.%s.onelogin.com/api/2/apps/%s"
        DELETE_APP_PARAMETER_URL = "https://api.%s.onelogin.com/api/2/apps/%s/parameters/%s"

        # Role URLs
        GET_ROLES_URL = "https://api.%s.onelogin.com/api/2/roles"
        CREATE_ROLE_URL = "https://api.%s.onelogin.com/api/2/roles"
        GET_ROLE_URL = "https://api.%s.onelogin.com/api/2/roles/%s"
        UPDATE_ROLES_URL = "https://api.%s.onelogin.com/api/2/roles/%s"
        DELETE_ROLES_URL = "https://api.%s.onelogin.com/api/2/roles/%s"
        GET_APPS_ROLE_URL = "https://api.%s.onelogin.com/api/2/roles/%s/apps"
        SET_APPS_ROLE_URL = "https://api.%s.onelogin.com/api/2/roles/%s/apps"
        GET_ROLE_FOR_USERS_URL = "https://api.%s.onelogin.com/api/2/roles/%s/users"
        ADD_ROLE_FOR_USERS_URL = "https://api.%s.onelogin.com/api/2/roles/%s/users"
        REMOVE_ROLE_FOR_USERS_URL = "https://api.%s.onelogin.com/api/2/roles/%s/users"
        GET_ROLE_FOR_ADMINS_URL = "https://api.%s.onelogin.com/api/2/roles/%s/admins"
        ADD_ROLE_FOR_ADMINS_URL = "https://api.%s.onelogin.com/api/2/roles/%s/admins"
        REMOVE_ROLE_FOR_ADMINS_URL = "https://api.%s.onelogin.com/api/2/roles/%s/admins"


        #Reports URLs
        LIST_REPORTS_URL = "https://api.%s.onelogin.com/api/2/reports"
        RUN_REPORTS_URL = "https://api.%s.onelogin.com/api/2/reports/%s/run"
        RUN_BACKGROUND_REPORTS_URL =  "https://api.%s.onelogin.com/api/2/reports/%s/run_background"

        # Event URLS
        GET_EVENT_TYPES_URL = "https://api.%s.onelogin.com/api/1/events/types"
        GET_EVENTS_URL = "https://api.%s.onelogin.com/api/1/events"
        CREATE_EVENT_URL = "https://api.%s.onelogin.com/api/1/events"
        GET_EVENT_URL = "https://api.%s.onelogin.com/api/1/events/%s"

        # Group URLs
        GET_GROUPS_URL = "https://api.%s.onelogin.com/api/1/groups"
        CREATE_GROUP_URL = "https://api.%s.onelogin.com/api/1/groups"
        GET_GROUP_URL = "https://api.%s.onelogin.com/api/1/groups/%s"

        # SAML Assertion URLs
        GET_SAML_ASSERTION_URL = "https://api.%s.onelogin.com/api/2/saml_assertion"
        GET_SAML_VERIFY_FACTOR = "https://api.%s.onelogin.com/api/2/saml_assertion/verify_factor"

        # SMART MFA URLs
        GET_SMART_MFA_URL = "https://api.%s.onelogin.com/api/2/smart-mfa"
        GET_SMART_MFA_VERIFY = "https://api.%s.onelogin.com/api/2/smart-mfa/verify"


        #API Authorization URL V2
        CREATE_AUTHORIZATION_SERVER_URL = "https://api.%s.onelogin.com/api/2/api_authorizations"
        LIST_AUTHORIZATION_SERVER_URL = "https://api.%s.onelogin.com/api/2/api_authorizations"
        GET_AUTHORIZATION_SERVER_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s"
        UPDATE_AUTHORIZATION_SERVER_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s"
        DELETE_AUTHORIZATION_SERVER_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s"

        ADD_ACCESS_TOKEN_CLAIMS_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/claims"
        LIST_ACCESS_TOKEN_CLAIMS_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/claims"
        UPDATE_ACCESS_TOKEN_CLAIMS_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/claims/%s"
        DELETE_ACCESS_TOKEN_CLAIMS_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/claims/%s"

        ADD_SCOPE_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/scopes"
        LIST_SCOPE_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/scopes"
        UPDATE_SCOPE_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/scopes/%s"
        DELETE_SCOPE_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/scopes/%s"

        ADD_CLIENTS_APPS_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/clients"
        LIST_CLIENTS_APPS_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/clients"
        UPDATE_CLIENTS_APPS_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/clients/%s"
        DELETE_CLIENTS_APPS_URL = "https://api.%s.onelogin.com/api/2/api_authorizations/%s/clients/%s"


        #Branding APIs
        LIST_ACCOUNT_BRANDS_URL = "https://api.%s.onelogin.com/api/2/branding/brands"
        CREATE_ACCOUNT_BRANDS_URL = "https://api.%s.onelogin.com/api/2/branding/brands"
        GET_ACCOUNT_BRANDS_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s"
        UPDATE_ACCOUNT_BRANDS_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s"
        DELETE_ACCOUNT_BRANDS_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s"

        GET_APPS_ASSOSIATED_WITH_ACCOUNT_BRANDS_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/apps"

        LIST_MESSAGE_TEMPLATE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/templates"
        CREATE_MESSAGE_TEMPLATE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/templates"
        UPDATE_MESSAGE_TEMPLATE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/templates/%s"
        GET_MESSAGE_TEMPLATE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/templates/%s"
        DELETE_MESSAGE_TEMPLATE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/templates/%s"
        GET_MESSAGE_TEMPLATE_BY_TYPE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/templates/%s"
        GET_MESSAGE_TEMPLATE_BY_TYPE_LOCALE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/templates/%s"
        GET_MASTER_MESSAGE_TEMPLATE_BY_TYPE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/master/templates/%s"
        GET_MASTER_MESSAGE_TEMPLATE_BY_TYPE_LOCALE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/master/templates/%s"
        UPDATE_MESSAGE_TEMPLATE_BY_TYPE_LOCALE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/templates/%s"
        LIST_LANGUAGE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/custom_error_messages/languages"
        LIST_CUSTOM_MESSAGE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/custom_error_messages"
        UPDATE_CUSTOM_MESSAGE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/custom_error_messages"
        DELETE_CUSTOM_MESSAGE_URL = "https://api.%s.onelogin.com/api/2/branding/brands/%s/custom_error_messages/%s"
        LOOKUP_CUSTOM_MESSAGE_URL = "https://api.%s.onelogin.com/api/2/branding/custom_error_messages"
        GET_EMAIL_SETTINGS_URL = "https://api.%s.onelogin.com/api/2/branding/email_settings"        


        # SMART Hooks URLs
        GET_SMART_HOOK_URL = "https://api.%s.onelogin.com/api/2/hooks/%s"
        LIST_SMART_HOOKS_URL = "https://api.%s.onelogin.com/api/2/hooks"
        GET_SMART_HOOK_LOGS_URL = "https://api.%s.onelogin.com/api/2/hooks/%s/logs"
        CREATE_SMART_HOOK_URL = "https://api.%s.onelogin.com/api/2/hooks"
        UPDATE_SMART_HOOK_URL = "https://api.%s.onelogin.com/api/2/hooks/%s"
        DELETE_SMART_HOOK_URL = "https://api.%s.onelogin.com/api/2/hooks/%s"
        CREATE_ENV_VAR_HOOK_URL = "https://api.%s.onelogin.com/api/2/hooks/envs"
        GET_ENV_VAR_HOOK_URL = "https://api.%s.onelogin.com/api/2/hooks/envs/%s"
        UPDATE_ENV_VAR_HOOK_URL = "https://api.%s.onelogin.com/api/2/hooks/envs/%s"
        DELETE_ENV_VAR_HOOK_URL = "https://api.%s.onelogin.com/api/2/hooks/envs/%s"
        LIST_ENV_VAR_HOOKS_URL = "https://api.%s.onelogin.com/api/2/hooks/envs"


        #User Mapping URL V2
        GET_USER_MAPPING_URL = "https://api.%s.onelogin.com/api/2/mappings/%s"
        LIST_USER_MAPPING_URL = "https://api.%s.onelogin.com/api/2/mappings"
        CREATE_USER_MAPPING_URL = "https://api.%s.onelogin.com/api/2/mappings"
        UPDATE_USER_MAPPING_URL = "https://api.%s.onelogin.com/api/2/mappings/%s"
        DELETE_USER_MAPPING_URL = "https://api.%s.onelogin.com/api/2/mappings/%s"
        DRY_RUN_USER_MAPPING_URL = "https://api.%s.onelogin.com/api/2/mappings/%s/dryrun"
      
        LIST_USER_MAPPING_CONDITION_URL = "https://api.%s.onelogin.com/api/2/mappings/conditions"
        LIST_USER_MAPPING_CONDITION_OPTS_URL = "https://api.%s.onelogin.com/api/2/mappings/conditions/%s/operators"
        LIST_USER_MAPPING_CONDITION_VALS_URL = "https://api.%s.onelogin.com/api/2/mappings/conditions/%s/values"
        LIST_USER_MAPPING_ACTIONS_URL = "https://api.%s.onelogin.com/api/2/mappings/actions"
        LIST_USER_MAPPING_ACTIONS_VAL_URL = "https://api.%s.onelogin.com/api/2/mappings/actions/%s/values"
        BULK_SORT_USER_MAPPING_URL = "https://api.%s.onelogin.com/api/2/mappings/sort"


        #VIGILANCE AI URLs
        GET_RISK_RULES_URL = "https://api.%s.onelogin.com/api/2/risk/rules/%s"
        LIST_RISK_RULES_URL = "https://api.%s.onelogin.com/api/2/risk/rules"
        CREATE_RISK_RULES_URL = "https://api.%s.onelogin.com/api/2/risk/rules"
        UPDATE_RISK_RULESURL = "https://api.%s.onelogin.com/api/2/risk/rules/%s"
        DELETE_RISK_RULES_URL = "https://api.%s.onelogin.com/api/2/risk/rules/%s"
        GET_RISK_SCORE_URL = "https://api.%s.onelogin.com/api/2/risk/scores"
        GET_RISK_VERIFY_URL = "https://api.%s.onelogin.com/api/2/risk/verify"
        TRACK_RISK_EVENTS_URL = "https://api.%s.onelogin.com/api/2/risk/events"

        #APPS RULES URLs
        GET_APPS_RULE_URL = "https://api.%s.onelogin.com/api/2/apps/%s/rules/%s"
        LIST_APPS_RULES_URL = "https://api.%s.onelogin.com/api/2/apps/%s/rules"
        CREATE_APP_RULE_URL = "https://api.%s.onelogin.com/api/2/apps/%s/rules"
        UPDATE_APP_RULE_URL = "https://api.%s.onelogin.com/api/2/apps/%s/rules/%s"
        DELETE_APP_RULE_URL = "https://api.%s.onelogin.com/api/2/apps/%s/rules/%s"
        
        LIST_APPS_RULES_CONDITION_URL = "https://api.%s.onelogin.com/api/2/apps/%s/rules/conditions"
        LIST_APPS_RULES_CONDITION_OPTS_URL = "https://api.%s.onelogin.com/api/2/apps/%s/rules/conditions/%s/operators"
        LIST_APPS_RULES_CONDITION_VALS_URL = "https://api.%s.onelogin.com/api/2/apps/%s/rules/conditions/%s/values"
        LIST_APPS_RULES_ACTIONS_URL = "https://api.%s.onelogin.com/api/2/apps/%s/rules/actions"
        LIST_APPS_RULES_ACTIONS_VAL_URL = "https://api.%s.onelogin.com/api/2/apps/%s/rules/actions/%s/values"
        BULK_SORT_APPS_RULES_URL = "https://api.%s.onelogin.com/api/2/apps/%s/rules/sort"

        #APP user  URLs 
        LIST_APPS_USERS_URL = "https://api.%s.onelogin.com/api/2/apps/%s/users"

        # Multi-Factor Authentication URLs
        #GET_FACTORS_URL = "https://api.%s.onelogin.com/api/1/users/%s/auth_factors"
        #ENROLL_FACTOR_URL = "https://api.%s.onelogin.com/api/1/users/%s/otp_devices"
        #GET_ENROLLED_FACTORS_URL = "https://api.%s.onelogin.com/api/1/users/%s/otp_devices"
        #ACTIVATE_FACTOR_URL = "https://api.%s.onelogin.com/api/1/users/%s/otp_devices/%s/trigger"
        VERIFY_FACTOR_URL = "https://api.%s.onelogin.com/api/1/users/%s/otp_devices/%s/verify"
        #REMOVE_FACTOR_URL = "https://api.%s.onelogin.com/api/1/users/%s/otp_devices/%s"

        # Invite Link URLS
        GENERATE_INVITE_LINK_URL = "https://api.%s.onelogin.com/api/1/invites/get_invite_link"
        SEND_INVITE_LINK_URL = "https://api.%s.onelogin.com/api/1/invites/send_invite_link"


        # Multi-Factor Authentication URL
        GET_FACTORS_URL = "https://api.%s.onelogin.com/api/2/mfa/users/%s/factors"
        ENROLL_FACTOR_URL = "https://api.%s.onelogin.com/api/2/mfa/users/%s/registrations"
        GET_ENROLLED_FACTORS_URL = "https://api.%s.onelogin.com/api/2/mfa/users/%s/devices"
        ACTIVATE_FACTOR_URL = "https://api.%s.onelogin.com/api/2/mfa/users/%s/verifications"
        # VERIFY_FACTOR_URL = "https://api.%s.onelogin.com/api/2/users/%s/otp_devices/%s/verify"
        REMOVE_FACTOR_URL = "https://api.%s.onelogin.com/api/2/mfa/users/%s/devices/%s"
        GENERATE_MFA_TOKEN_URL = "https://api.%s.onelogin.com/api/2/mfa/users/%s/mfa_token"
        VERIFY_ENROLLMENT_VOICE_FACTOR_URL = "https://api.%s.onelogin.com/api/2/mfa/users/%s/registrations/%s"

        # Embed Apps URL
        EMBED_APP_URL = "https://api.onelogin.com/client/apps/embed2"

        # Privileges URLS
        LIST_PRIVILEGES_URL = "https://api.%s.onelogin.com/api/1/privileges"
        CREATE_PRIVILEGE_URL = "https://api.%s.onelogin.com/api/1/privileges"
        UPDATE_PRIVILEGE_URL = "https://api.%s.onelogin.com/api/1/privileges/%s"
        GET_PRIVILEGE_URL = "https://api.%s.onelogin.com/api/1/privileges/%s"
        DELETE_PRIVILEGE_URL = "https://api.%s.onelogin.com/api/1/privileges/%s"
        GET_ROLES_ASSIGNED_TO_PRIVILEGE_URL = "https://api.%s.onelogin.com/api/1/privileges/%s/roles"
        ASSIGN_ROLES_TO_PRIVILEGE_URL = "https://api.%s.onelogin.com/api/1/privileges/%s/roles"
        REMOVE_ROLE_FROM_PRIVILEGE_URL = "https://api.%s.onelogin.com/api/1/privileges/%s/roles/%s"
        GET_USERS_ASSIGNED_TO_PRIVILEGE_URL = "https://api.%s.onelogin.com/api/1/privileges/%s/users"
        ASSIGN_USERS_TO_PRIVILEGE_URL = "https://api.%s.onelogin.com/api/1/privileges/%s/users"
        REMOVE_USER_FROM_PRIVILEGE_URL = "https://api.%s.onelogin.com/api/1/privileges/%s/users/%s"
        VALID_ACTIONS = [
          "apps:List",
          "apps:Get",
          "apps:Create",
          "apps:Update",
          "apps:Delete",
          "apps:ManageRoles",
          "apps:ManageUsers",
          "directories:List",
          "directories:Get",
          "directories:Create",
          "directories:Update",
          "directories:Delete",
          "directories:SyncUsers",
          "directories:RefreshSchema",
          "events:List",
          "events:Get",
          "mappings:List",
          "mappings:Get",
          "mappings:Create",
          "mappings:Update",
          "mappings:Delete",
          "mappings:ReapplyAll",
          "policies:List",
          "policies:user:Get",
          "policies:user:Create",
          "policies:user:Update",
          "policies:user:Delete",
          "policies:app:Get",
          "policies:app:Create",
          "policies:app:Update",
          "policies:app:Delete",
          "privileges:List",
          "privileges:Get",
          "privileges:Create",
          "privileges:Update",
          "privileges:Delete",
          "privileges:ListUsers",
          "privileges:ListRoles",
          "privileges:ManageUsers",
          "privileges:ManageRoles",
          "reports:List",
          "reports:Get",
          "reports:Create",
          "reports:Update",
          "reports:Delete",
          "reports:Run",
          "roles:List",
          "roles:Get",
          "roles:Create",
          "roles:Update",
          "roles:Delete",
          "roles:ManageUsers",
          "roles:ManageApps",
          "trustedidp:List",
          "trustedidp:Get",
          "trustedidp:Create",
          "trustedidp:Update",
          "trustedidp:Delete",
          "users:List",
          "users:Get",
          "users:Create",
          "users:Update",
          "users:Delete",
          "users:Unlock",
          "users:ResetPassword",
          "users:ForceLogout",
          "users:Invite",
          "users:ReapplyMappings",
          "users:ManageRoles",
          "users:ManageApps",
          "users:GenerateTempMfaToken"
        ]
      end
    end
  end
end
