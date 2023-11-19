# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module ResetPassword
          module Meta
            TRACK = 'user/password-reset'

            UNLOCALIZED_PATH = {
              pl: 'zresetuj-haslo',
              en: 'reset-password',
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Zresetuj Hasło',
              en: 'Reset Password',
            }.freeze

            PRIORITY = '0.5'

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
                pl: "hasło, reset, resetowanie, konto, użytkownik, #{MAPAWYNAJMU_PL_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                en: "password, reset, account, user, #{MAPAWYNAJMU_PL_NAME}, announcement, lease, real estate, warsaw"
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: "Resetowanie hasła do konta na #{MAPAWYNAJMU_PL_NAME} - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                en: "Account password reset on #{MAPAWYNAJMU_PL_NAME} - a service featuring real estate lease announcements in Warsaw."
              }.freeze
            end

            def render
              {
                visitor: true,
                user: true,
                'user/password-reset': true
              }
            end

            def links
              {
                'current/pl': ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Linker.new(:en).call
              }
            end

            # def priority
            #   @priority ||= PRIORITY
            # end
            
            def changeFreq
              @changeFreq ||= CHANGE_FREQ
            end
          end
        end
      end
    end
  end
end
