# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Authorize
          module Meta
            TRACK = 'user/authorize'

            UNLOCALIZED_PATH = {
              pl: 'zaloguj',
              en: 'sign-in'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Zaloguj',
              en: 'Sign In'
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
                pl: "zaloguj, logowanie, konto, użytkownik, #{MAPAWYNAJMU_PL_APP_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                en: "sign in, log in, account, user, #{MAPAWYNAJMU_PL_APP_NAME}, announcement, lease, real estate, warsaw"
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: "Logowanie do konta na #{MAPAWYNAJMU_PL_APP_NAME} - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                en: "Sign in to #{MAPAWYNAJMU_PL_APP_NAME} - a service featuring real estate lease announcements in Warsaw."
              }.freeze
            end

            def render
              {
                visitor: true,
                user: true,
                'user/authorize': true
              }
            end

            def links
              {
                'current/pl': ::MapawynajmuPl::Api::Tracks::User::Authorize::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::User::Authorize::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
