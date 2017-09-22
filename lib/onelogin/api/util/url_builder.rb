module OneLogin
  module Api
    module Util
      module UrlBuilder

        # Build the URL of the API endpoint
        #
        # @param base [String] Base of the endpoint
        # @param obj_id [String, nil] Id of the referenced object
        #
        def get_url(base, obj_id=nil)
          if obj_id.nil? || obj_id.to_s.empty?
            base % [@region]
          else
            base % [@region, obj_id]
          end
        end
      end
    end
  end
end
