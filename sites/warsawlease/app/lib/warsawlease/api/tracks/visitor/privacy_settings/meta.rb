# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Visitor
        module PrivacySettings
          module Meta
            TRACK = 'visitor/privacy-settings'

            UNLOCALIZED_PATH = {
              pl: 'ustawienia-prywatnosci',
              en: 'privacy-settings'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Ustawienia Prywatności',
              en: 'Privacy Settings'
            }.freeze

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'ustawienia prywatności, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'privacy settings, warsawlease.pl, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Ustawwienia Prywatności warsawlease.pl, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Privacy Settings of warsawlease.pl, a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
