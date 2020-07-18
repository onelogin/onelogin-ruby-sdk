require "spec_helper"

RSpec.describe OneLogin::Api::Models::V1::Event do

  context 'with data retrieved from the API' do

    it 'has an app_name attribute' do
      event = OneLogin::Api::Models::V1::Event.new({
        'app_name' => 'Sample App'
      })

      expect(event).to have_attributes(:app_name => 'Sample App')
    end

  end

end
