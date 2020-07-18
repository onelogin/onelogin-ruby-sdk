require "spec_helper"

RSpec.describe OneLogin::Api::Models::V1::EmbedApp do

  before(:all) do
    @app_data = {
      'id'=>'1234',
      'icon'=>'https://some.img',
      'name'=>'Demo App',
      'provisioned'=>'0',
      'extension_required'=>'1',
      'personal'=>'0',
      'login_id'=>'5678'
    }
  end

  context 'with data retrieved from the API' do

    it 'initializes the model' do
      embed_app = OneLogin::Api::Models::V1::EmbedApp.new(@app_data)

      expect(embed_app.id).to eq(1234)
      expect(embed_app.icon).to eq('https://some.img')
      expect(embed_app.name).to eq('Demo App')
      expect(embed_app.provisioned).to eq(0)
      expect(embed_app.extension_required).to eq(true)
      expect(embed_app.personal).to eq(false)
      expect(embed_app.login_id).to eq(5678)
    end

  end

  context 'with truthy values' do

    it 'returns true' do
      embed_app = OneLogin::Api::Models::V1::EmbedApp.new({
        'id'=>'1234',
        'icon'=>'https://some.img',
        'name'=>'Demo App',
        'provisioned'=>'1',
        'extension_required'=>'true',
        'personal'=>'1',
        'login_id'=>'5678'
      })

      expect(embed_app.personal).to eq(true)
      expect(embed_app.extension_required).to eq(true)
    end

  end

  context 'with falsey values' do

    it 'returns false' do
      embed_app = OneLogin::Api::Models::V1::EmbedApp.new({
        'id'=>'1234',
        'icon'=>'https://some.img',
        'name'=>'Demo App',
        'provisioned'=>'1',
        'extension_required'=>'false',
        'personal'=>'0',
        'login_id'=>'5678'
      })

      expect(embed_app.personal).to eq(false)
      expect(embed_app.extension_required).to eq(false)
    end

  end

end
