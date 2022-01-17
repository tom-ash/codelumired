# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Verification
            module Meta
              TRACK = 'user/create/verification'

              UNLOCALIZED_PATH = {
                pl: 'potwierdzenie-adresu-email',
                en: 'email-address-confirmation'
              }.freeze

              UNLOCALIZED_TITLE = {
                pl: 'Potwierdzenie Adresu Email',
                en: 'Email Address Confirmation'
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
                  pl: "potwierdzenie, email, konto, użytkownik, #{MAPAWYNAJMU_PL_APP_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                  en: "email, confirmation, registration, account, user, #{MAPAWYNAJMU_PL_APP_NAME}, announcement, lease, real estate, warsaw"
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  pl: "Potwierdzenie adresu email na #{MAPAWYNAJMU_PL_APP_NAME} - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                  en: "Email address confirmation on #{MAPAWYNAJMU_PL_APP_NAME} - a service featuring real estate lease announcements in Warsaw."
                }.freeze
              end

              def render
                {
                  visitor: true,
                  user: true,
                  'user/create': true,
                  'user/create/verification': true
                }
              end

              def links
                {
                  'current/pl': ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Linker.new(:pl).call,
                  'current/en': ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Linker.new(:en).call
                }
              end
            end
          end
        end
      end
    end
  end
end
