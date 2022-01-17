# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module CookiesPolicy
          module Meta
            TRACK = 'visitor/cookies-policy'

            UNLOCALIZED_PATH = {
              pl: 'polityka-cookies',
              en: 'cookies-policy'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Polityka Cookies',
              en: 'Cookies Policy'
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
                pl: "polityka cookies, #{MAPAWYNAJMU_PL_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                en: "cookies policy, #{MAPAWYNAJMU_PL_NAME}, announcement, lease, real estate, warsaw"
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: "Polityka Cookies #{MAPAWYNAJMU_PL_NAME}, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                en: "Cookies Policy of #{MAPAWYNAJMU_PL_NAME}, a service featuring real estate lease announcements in Warsaw."
              }.freeze
            end

            def render
              {
                visitor: true,
                'visitor/cookies-policy': true
              }
            end

            def links
              {
                'current/pl': ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
