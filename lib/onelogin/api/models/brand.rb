require 'onelogin/api/util/utils.rb'
require 'onelogin/api/models/base.rb'

module OneLogin
    module Api
      module Models
  
        class Brand Base
            attr_accessor :id, :name, :enabled, :custom_support_enabled, :custom_color,
                          :@custom_accent_color, :custom_masking_color, :custom_masking_opacity,
                          :enable_custom_label_for_login_screen, :enable_custom_label_for_login_screen,
                          :login_instruction, :login_instruction_title, :mfa_enrollment_message,
                          :hide_onelogin_footer, :background, :logo

            def initialize(data)

                @id = str2ing(data['id', nil])
                @name = data['name']
                @enabled = str2bool(data['enabled', False])
                @custom_support_enabled = data['custom_support_enabled', nil]
                @custom_color = data['custom_color', nil]
                @custom_accent_color = data['custom_accent_color', nil]
                @custom_masking_color = data['custom_masking_color', nil]
                @custom_masking_opacity = str2int(data['custom_masking_opacity', nil])
                @enable_custom_label_for_login_screen = str2bool(data['enable_custom_label_for_login_screen', nil])
                @custom_label_text_for_login_screen = data['custom_label_text_for_login_screen', nil]
                @login_instruction = data['login_instruction', nil]
                @login_instruction_title = data['login_instruction_title', nil]
                @mfa_enrollment_message = data['mfa_enrollment_message', nil]
                @hide_onelogin_footer = str2bool(data['hide_onelogin_footer', nil])
                @background = data['background', nil]
                @logo = data['logo', nil]
            end 
        end
    end
end
end    