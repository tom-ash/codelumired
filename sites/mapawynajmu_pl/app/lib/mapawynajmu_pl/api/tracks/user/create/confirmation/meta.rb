# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Confirmation
            module Meta
              TRACK = 'user/create/confirmation'

              PATH_PL = 'potwierdzenie-utworzenia-konta'
              PATH_EN = 'account-creation-confirmation'

              UNLOCALIZED_PATH = {
                pl: %r{#{PATH_PL}/(?<user_id>\d+)},
                en: %r{#{PATH_EN}/(?<user_id>\d+)},
              }.freeze

              UNLOCALIZED_TITLE = {
                pl: 'Potwierdzenie utworzenia konta',
                en: 'Account creation confirmation',
              }.freeze

              private

              def track
                @track ||= TRACK
              end

              def match_data
                @match_data ||= unlocalized_path[lang].match(url)
              end

              def user_id
                @user_id ||= match_data[:user_id]
              end

              def user
                @user ||= ::MapawynajmuPl::User.find(user_id)
              end

              def unlocalized_path
                @unlocalized_path ||= UNLOCALIZED_PATH
              end

              def unlocalized_title
                @unlocalized_title ||= UNLOCALIZED_TITLE
              end

              def unlocalized_keywords
                @unlocalized_keywords ||= {
                  pl: "potwierdzenie, email, konto, użytkownik, #{MAPAWYNAJMU_PL_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                  en: "email, confirmation, registration, account, user, #{MAPAWYNAJMU_PL_NAME}, announcement, lease, real estate, warsaw",
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  pl: "Potwierdzenie adresu email na #{MAPAWYNAJMU_PL_NAME} - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                  en: "Email address confirmation on #{MAPAWYNAJMU_PL_NAME} - a service featuring real estate lease announcements in Warsaw.",
                }.freeze
              end

              def render
                {
                  'visitor': true,
                  'user': true,
                  'user/create': true,
                  'user/create/confirmation': true,
                }
              end

              def link_decorators
                {
                  user_id: user_id,
                }
              end

              def links
                {
                  'current/pl': ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Linker.new(:pl, link_decorators).call,
                  'current/en': ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Linker.new(:en, link_decorators).call,
                }
              end
            end
          end
        end
      end
    end
  end
end
