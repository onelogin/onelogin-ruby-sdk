module OneLogin
  module Api
    module Util
      module UrlBuilder

        # The version segment of a versioned endpoint, e.g. "/api/1/"
        API_VERSION_SEGMENT = %r{/api/\d+/}

        # Build the URL of the API endpoint
        #
        # @param base [String] Base of the endpoint
        # @param obj_id [String, nil] Id of the referenced object
        # @param extra_id [String, nil] Id of the secundary referenced object
        # @param version [Integer, nil] API version to call. Defaults to the
        #   version already in the base.
        #
        def url_for(base, obj_id=nil, extra_id=nil, version: nil)
          base = with_api_version(base, version) unless version.nil?

          if obj_id.nil? || obj_id.to_s.empty?
            base % [@region]
          elsif extra_id.nil? || extra_id.to_s.empty?
            base % [@region, obj_id]
          else
            base % [@region, obj_id, extra_id]
          end
        end

        private

        # Swap the version segment of an endpoint, so the URL constants keep
        # their current values and stay the default.
        #
        # Raises rather than calling a version nobody asked for. The client
        # still rescues this into error '500', but error_description then names
        # the endpoint.
        #
        def with_api_version(base, version)
          unless base.scan(API_VERSION_SEGMENT).size == 1
            raise ArgumentError, "#{base} has no single API version segment to replace"
          end

          base.sub(API_VERSION_SEGMENT, "/api/#{version}/")
        end
      end
    end
  end
end
