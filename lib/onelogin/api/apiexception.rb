module OneLogin
  module Api
    class ApiException < Exception
      def initialize(message, code)
        super(message)
        @code = code
      end
    end
  end
end