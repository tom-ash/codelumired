# frozen_string_literal: true

module Codelumi
  module Api
    module Visitor
      module Tracks
        module PrivacyPolicy
          module Meta
            UNLOCALIZED_TITLE = {
              pl: 'Polityka Prywatności',
              en: 'Privacy Policy'
            }.freeze

            private

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'polityka prywatności, soundof.IT, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'privacy policy, soundof.IT, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Polityka prywatności soundof.IT, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Privacy Policy of soundof.IT, a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
