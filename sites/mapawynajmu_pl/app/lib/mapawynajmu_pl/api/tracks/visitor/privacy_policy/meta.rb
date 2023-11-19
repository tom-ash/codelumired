# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          module Meta
            TRACK = 'visitor/privacy-policy'

            UNLOCALIZED_PATH = {
              pl: 'polityka-prywatnosci',
              en: 'privacy-policy'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Polityka Prywatności',
              en: 'Privacy Policy'
            }.freeze

            PRIORITY = '0.5'

            CHANGE_FREQ = 'monthly'

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
                pl: "polityka prywatności, #{MAPAWYNAJMU_PL_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                en: "privacy policy, #{MAPAWYNAJMU_PL_NAME}, announcement, lease, real estate, warsaw"
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: "Polityka prywatności #{MAPAWYNAJMU_PL_NAME}, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                en: "Privacy Policy of #{MAPAWYNAJMU_PL_NAME}, a service featuring real estate lease announcements in Warsaw."
              }.freeze
            end

            def render
              {
                visitor: true,
                'visitor/privacy-policy': true
              }
            end

            def links
              {
                'current/pl': ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
