module OneLogin
  module Api
    module Util
      module UrlBuilder

        # Build the URL of the API endpoint
        #
        # @param base [String] Base of the endpoint
        # @param obj_id [String, nil] Id of the referenced object
        # @param extra_id [String, nil] Id of the secundary referenced object
        #
        def url_for(base, obj_id=nil, extra_id=nil)
          if obj_id.nil? || obj_id.to_s.empty?
            base % [@region]
          elsif extra_id.nil? || extra_id.to_s.empty?
            base % [@region, obj_id]
          else
            base % [@region, obj_id, extra_id]
          end
        end
      end
    end
  end
end
