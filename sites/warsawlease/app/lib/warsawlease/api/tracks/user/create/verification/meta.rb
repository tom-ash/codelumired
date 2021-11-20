# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module User
        module Create
          module Verification
            module Meta
              TRACK = 'user/create/verification'

              UNLOCALIZED_PATH = {
                pl: 'zarejestruj/potwierdz',
                en: 'sign-up/confirm'
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
                  pl: 'potwierdzenie, email, konto, użytkownik, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                  en: 'email, confirmation, registration, account, user, warsawlease.pl, announcement, lease, real estate, warsaw'
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  pl: 'Potwierdzenie adresu email na warsawlease.pl - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                  en: 'Email address confirmation on warsawlease.pl - a service featuring real estate lease announcements in Warsaw.'
                }.freeze
              end
            end
          end
        end
      end
    end
  end
end
