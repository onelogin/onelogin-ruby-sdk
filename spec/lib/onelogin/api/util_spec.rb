require "spec_helper"
# require 'onelogin/api/util/string_utils'

RSpec.describe OneLogin::Api::Util::StringUtils do
  include OneLogin::Api::Util
  
  context 'stringutils' do
    it 'str2bool' do
      expect(str2bool(nil)).to be nil
      expect(str2bool(true)).to be true
      expect(str2bool(false)).to be false

      expect(str2bool('true')).to be true
      expect(str2bool('TrUe')).to be true
      expect(str2bool('yes')).to be true
      expect(str2bool('T')).to be true
      expect(str2bool('1')).to be true

      expect(str2bool('false')).to be false
      expect(str2bool('something')).to be false
    end

    it 'str2date' do
        expect(str2date(nil)).to be nil
        expect(str2date("3rd Feb 2001 04:05:06 PM")).to eq DateTime.new(2001, 2, 3, 16, 5, 6)
        expect(str2date("3/2/2001 16:05:06")).to eq DateTime.new(2001, 2, 3, 16, 5, 6)
        expect(str2date("February 3rd,2001 16:05:06")).to eq DateTime.new(2001, 2, 3, 16, 5, 6)
    end    

    it 'str2int' do
        expect(str2int(nil)).to be nil
        expect(str2int("something")).to be nil
        expect(str2int("15")).to be 15
        expect(str2int(9)).to eq(9)
    end    
  end
   

end