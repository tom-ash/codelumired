# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Edit
          module Meta
            TRACK = 'user/edit'

            UNLOCALIZED_PATH = {
              pl: 'ustawienia-konta',
              en: 'account-settings',
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Ustawienia Konta',
              en: 'Account Settings',
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
                pl: "konto, ustawienia, użytkownik, #{MAPAWYNAJMU_PL_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                en: "account, settings, user, #{MAPAWYNAJMU_PL_NAME}, announcement, lease, real estate, warsaw",
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: "Ustawienia konta na #{MAPAWYNAJMU_PL_NAME} - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                en: "Account settings on #{MAPAWYNAJMU_PL_NAME} - a service featuring real estate lease announcements in Warsaw.",
              }.freeze
            end

            def render
              {
                visitor: true,
                user: true,
                'user/edit': true,
              }
            end

            def links
              {
                'current/pl': ::MapawynajmuPl::Api::Tracks::User::Edit::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::User::Edit::Linker.new(:en).call,
              }
            end

            def asset_names
              @asset_names ||= %i[chevron lock]
            end
          end
        end
      end
    end
  end
end
