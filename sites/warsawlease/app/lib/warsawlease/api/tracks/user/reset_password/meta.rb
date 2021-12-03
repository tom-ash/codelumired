# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module User
        module ResetPassword
          module Meta
            TRACK = 'user/reset-password'

            UNLOCALIZED_PATH = {
              pl: 'zresetuj-haslo',
              en: 'reset-password'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Zresetuj Hasło',
              en: 'Reset Password'
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
                pl: 'hasło, reset, resetowanie, konto, użytkownik, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'password, reset, account, user, warsawlease.pl, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Resetowanie hasła do konta na warsawlease.pl - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Account password reset on warsawlease.pl - a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end

            def render
              {
                visitor: true,
                user: true,
                'user/reset-password': true
              }
            end

            def links
              {
                'current/pl': ::Warsawlease::Api::Tracks::User::ResetPassword::Linker.new(:pl).call,
                'current/en': ::Warsawlease::Api::Tracks::User::ResetPassword::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
