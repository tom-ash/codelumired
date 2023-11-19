# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            module Meta
              TRACK = 'user/new/form'

              UNLOCALIZED_PATH = {
                pl: 'zarejestruj',
                en: 'sign-up',
              }.freeze

              UNLOCALIZED_TITLE = {
                pl: 'Zarejestruj',
                en: 'Sign Up',
              }.freeze

              PRIORITY = '0.8'

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
                  pl: "rejestracja, konto, użytkownik, #{MAPAWYNAJMU_PL_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                  en: "sign up, registration, account, user, #{MAPAWYNAJMU_PL_NAME}, announcement, lease, real estate, warsaw",
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  pl: "Rejestracja konta użytkownika na #{MAPAWYNAJMU_PL_NAME} - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                  en: "Account registration on #{MAPAWYNAJMU_PL_NAME} - a service featuring real estate lease announcements in Warsaw.",
                }.freeze
              end

              def render
                {
                  'visitor': true,
                  'user': true,
                  'user/new': true,
                  'user/new/form': true,
                }
              end

              def links
                {
                  'current/pl': ::MapawynajmuPl::Api::Tracks::User::Create::Form::Linker.new(:pl).call,
                  'current/en': ::MapawynajmuPl::Api::Tracks::User::Create::Form::Linker.new(:en).call,
                }
              end

              def asset_names
                @asset_names ||= %i[
                  chevron
                  facebook_square
                  linkedin_square
                  twitter_square
                ]
              end
            end
          end
        end
      end
    end
  end
end
