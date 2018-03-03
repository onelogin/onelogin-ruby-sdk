require 'onelogin'

client = OneLogin::Api::Client.new(
    client_id: 'ONELOGIN_CLIENT_ID',
    client_secret:'ONELOGIN_CLIENT_SECRET',
    region: 'us'
)

attribute_names = ['id', 'external_id', 'email', 'username', 'firstname', 'lastname', 'distinguished_name',
                  'phone', 'company', 'department', 'status', 'member_of', 'samaccountname', 'userprincipalname',
                  'group_id', 'role_ids', 'custom_attributes', 'openid_name', 'locale_code', 'comment', 'directory_id',
                  'manager_ad_id', 'trusted_idp_id', 'activated_at', 'created_at', 'updated_at',
                  'password_changed_at', 'invitation_sent_at', 'invalid_login_attempts', 'last_login', 'locked_until']

custom_attribute_names = client.get_custom_attributes

CSV.open('users.csv', 'wb') do |csv|
  # header row
  csv << attribute_names + custom_attribute_names

  client.get_users.each do |user|

    row = []

    # standard attributes
    attribute_names.each do |attribute_name|
      row << user.send(attribute_name)
    end

    # custom attributes
    custom_attribute_names.collect do |attribute_name|
      row << user.custom_attributes[attribute_name] unless user.custom_attributes.empty?
    end

    csv << row
  end
end

