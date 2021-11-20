# frozen_string_literal: true

module Codelumi
  module Api
    module Visitor
      module Tracks
        module Contact
          module Meta
            UNLOCALIZED_TITLE = {
              pl: 'Kontakt',
              en: 'Contact'
            }.freeze

            private

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'kontakt, soundof.IT, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'contact, soundof.IT, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Kontakt do soundof.IT, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Contact to soundof.IT, a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
