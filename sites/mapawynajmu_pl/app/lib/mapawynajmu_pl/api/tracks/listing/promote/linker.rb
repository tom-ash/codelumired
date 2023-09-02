# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Promote
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            PROMOTE_LISTING_PATH = {
              pl: 'wyroznij-ogloszenie',
              en: 'promote-listing',
            }

            PROMOTE_LISTING_TITLE = {
              pl: 'Wyróżnij ogłoszenie',
              en: 'Promote the Listing'
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
              "#{PROMOTE_LISTING_PATH[lang]}/#{listing_id}"
            end

            def title
              PROMOTE_LISTING_TITLE[lang]
            end
          end
        end
      end
    end
  end
end
