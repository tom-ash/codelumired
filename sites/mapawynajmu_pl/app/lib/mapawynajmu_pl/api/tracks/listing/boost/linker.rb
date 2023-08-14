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
                path: "podbij-ogloszenie/#{listing_id}",
                title: "boost-listing/#{listing_id}",
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
