# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Boost
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::Listing::Boost::Meta
            include ::MapawynajmuPl::Api::Tracks::Listing::Boost::Assets

            private

            def listing
              @listing ||= ::MapawynajmuPl::Listing.find(listing_id)
            end

            def listing_id
              @listing_id = attrs[:url].match(%r{(podbij-ogloszenie|boost-listing)/(\d+)})[2]
            end
          end
        end
      end
    end
  end
end
