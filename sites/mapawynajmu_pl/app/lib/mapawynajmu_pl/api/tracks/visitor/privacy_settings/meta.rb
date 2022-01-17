# frozen_string_literal: true

module MapawynajmuPl
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
                pl: "ustawienia prywatności, #{MAPAWYNAJMU_PL_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                en: "privacy settings, #{MAPAWYNAJMU_PL_NAME}, announcement, lease, real estate, warsaw"
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: "Ustawwienia Prywatności #{MAPAWYNAJMU_PL_NAME}, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                en: "Privacy Settings of #{MAPAWYNAJMU_PL_NAME}, a service featuring real estate lease announcements in Warsaw."
              }.freeze
            end

            def render
              {
                visitor: true,
                'visitor/privacy-settings': true
              }
            end

            def links
              {
                'current/pl': ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
