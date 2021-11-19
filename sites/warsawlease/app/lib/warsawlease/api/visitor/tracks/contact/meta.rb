# frozen_string_literal: true

module Warsawlease
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
                pl: 'kontakt, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'contact, warsawlease.pl, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Kontakt do warsawlease.pl, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Contact to warsawlease.pl, a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
