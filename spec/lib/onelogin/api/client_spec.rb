require "spec_helper"

RSpec.describe OneLogin do
  
  context 'with a client_id and client_secret' do
  
    it 'initializes the client' do 
      client = OneLogin::Api::Client.new(
        client_id: 'blah',
        client_secret: 'blah'
      )
      
      expect(client).not_to be nil 
    end
  
  end

  context 'with out a client_id and client_secret' do
    
    it 'raises an ArgumentError' do 
      expect{OneLogin::Api::Client.new({})}.to raise_error(ArgumentError)
    end
    
  end  

  context 'with region' do
    
    it 'defaults to "us"' do 
      client = OneLogin::Api::Client.new(
        client_id: 'blah',
        client_secret: 'blah'
      )
      
      expect(client.region).to eq("us")
    end 

    it 'can be set to "eu"' do 
      client = OneLogin::Api::Client.new(
        client_id: 'blah',
        client_secret: 'blah',
        region: 'eu'
      )
      
      expect(client.region).to eq("eu")
    end    

  end

end