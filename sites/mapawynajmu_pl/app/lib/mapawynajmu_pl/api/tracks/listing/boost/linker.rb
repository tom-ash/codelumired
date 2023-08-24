# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Boost
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            BOOST_LISTING_PATH = {
              pl: 'podbij-ogloszenie',
              en: 'boost-listing',
            }

            BOOST_LISTING_TITLE = {
              pl: 'Podbij ogłoszenie',
              en: 'Boost Listing'
            }

            def initialize(listing_id:, lang:)
              @listing_id = listing_id
              @lang = lang
            end

            def call
              {
                path: path,
                title: title,
              }
            end

            private

            attr_reader :listing_id, :lang

            def path
              "#{BOOST_LISTING_PATH[lang]}/#{listing_id}"
            end

            def title
              BOOST_LISTING_TITLE[lang]
            end
          end
        end
      end
    end
  end
end
