# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module ResetPassword
          module Meta
            include ::Helpers::MetaLocalizations

            TRACK = 'user/password-reset'

            UNLOCALIZED_PATH = {
              pl: 'zresetuj-haslo',
              en: 'reset-password',
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Zresetuj Hasło',
              en: 'Reset Password',
            }.freeze

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end

            def metaLozalizationPath
              @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/reset_password/localizations/meta/#{lang}.json"
            end

            def render
              {
                visitor: true,
                user: true,
                'user/password-reset': true,
              }
            end

            def links
              {
                'current/pl': ::SkillfindTech::Api::Tracks::User::ResetPassword::Linker.new(:pl).call,
                'current/en': ::SkillfindTech::Api::Tracks::User::ResetPassword::Linker.new(:en).call,
              }
            end
          end
        end
      end
    end
  end
end
