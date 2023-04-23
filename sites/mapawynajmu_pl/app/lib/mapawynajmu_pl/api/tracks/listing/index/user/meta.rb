# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Index
          module User
            module Meta
              TRACK = 'announcement/index/user'

              UNLOCALIZED_PATH = {
                pl: 'moje-ogloszenia',
                en: 'my-announcements',
              }.freeze

              UNLOCALIZED_TITLE = {
                pl: 'Moje ogłoszenia',
                en: 'My announcements',
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
                  pl: "ogłoszenia, moje, konto, użytkownik, #{MAPAWYNAJMU_PL_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                  en: "announcements, my, account, user, #{MAPAWYNAJMU_PL_NAME}, announcement, lease, real estate, warsaw",
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  pl: "Moje ogłoszenia na #{MAPAWYNAJMU_PL_NAME} - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                  en: "My announcements on #{MAPAWYNAJMU_PL_NAME} - a service featuring real estate lease announcements in Warsaw.",
                }.freeze
              end

              def render
                {
                  visitor: true,
                  announcement: true,
                  'announcement/index': true,
                  'announcement/index/user': true,
                }
              end

              def links
                {
                  'current/pl': ::MapawynajmuPl::Api::Tracks::Listing::Index::User::Linker.new(:pl).call,
                  'current/en': ::MapawynajmuPl::Api::Tracks::Listing::Index::User::Linker.new(:en).call,
                }
              end
            end
          end
        end
      end
    end
  end
end
