# frozen_string_literal: true

module Warsawlease
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
                pl: 'polityka prywatności, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'privacy policy, warsawlease.pl, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Polityka prywatności warsawlease.pl, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Privacy Policy of warsawlease.pl, a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
