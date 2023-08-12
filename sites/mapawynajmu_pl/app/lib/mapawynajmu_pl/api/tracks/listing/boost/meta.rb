# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Boost
          module Meta
            TRACK = 'listingBoost'

            UNLOCALIZED_PATH = {
              pl: %r{^podbij-ogloszenie/\d+$},
              en: %r{^boost-listing/\d+$},
            }.freeze

            private

            def render
              {
                visitor: true,
                announcement: true,
                listingBoost: true,
              }
            end

            def links
              {
                'current/pl': MapawynajmuPl::Api::Tracks::Listing::Boost::Linker.new(listing_id: listing_id, lang: :pl).call,
                'current/en': MapawynajmuPl::Api::Tracks::Listing::Boost::Linker.new(listing_id: listing_id, lang: :en).call,
              }
            end

            def title
              @title ||= nil
            end

            def description
              @description ||= nil
            end

            def keywords
              @keywords ||= nil
            end
          end
        end
      end
    end
  end
end
