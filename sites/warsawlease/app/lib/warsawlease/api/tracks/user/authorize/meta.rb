# frozen_string_literal: true

module Warsawlease
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
                pl: 'zaloguj, logowanie, konto, użytkownik, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'sign in, log in, account, user, warsawlease.pl, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Logowanie do konta na warsawlease.pl - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Sign in to warsawlease.pl - a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
