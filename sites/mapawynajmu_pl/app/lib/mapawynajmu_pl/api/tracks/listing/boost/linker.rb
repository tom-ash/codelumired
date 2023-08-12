# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Boost
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            def initialize(listing_id:, lang:)
              @listing_id = listing_id
              @lang = lang
            end

            def call
              {
                path: 'TODO', #::MapawynajmuPl::Listing.find(listing_id).boost_path(lang),
                title: 'TODO',
              }
            end

            private

            attr_reader :listing_id, :lang

            def title
              {
                pl: 'Podbij ogłoszenie',
                en: 'Boost Listing'
              }
            end
          end
        end
      end
    end
  end
end
