# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module User
        module Create
          module Form
            module Meta
              TRACK = 'user/create/form'

              UNLOCALIZED_PATH = {
                pl: 'zarejestruj',
                en: 'sign-up'
              }.freeze

              UNLOCALIZED_TITLE = {
                pl: 'Zarejestruj',
                en: 'Sign Up'
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
                  pl: 'rejestracja, konto, użytkownik, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                  en: 'sign up, registration, account, user, warsawlease.pl, announcement, lease, real estate, warsaw'
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  pl: 'Rejestracja konta użytkownika na warsawlease.pl - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                  en: 'Account registration on warsawlease.pl - a service featuring real estate lease announcements in Warsaw.'
                }.freeze
              end
            end
          end
        end
      end
    end
  end
end
