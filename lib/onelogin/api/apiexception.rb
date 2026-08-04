module OneLogin
  module Api
    class ApiException < Exception
      # HTTP status (or API status code) the exception was raised for.
      attr_reader :code

      def initialize(message, code)
        super(message)
        @code = code
      end
    end
  end
end