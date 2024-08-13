# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Auth
          module Meta
            include ::Helpers::MetaLocalizations

            TRACK = 'user/auth'

            UNLOCALIZED_PATH = {
              pl: 'zaloguj',
              en: 'sign-in',
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Zaloguj',
              en: 'Sign In',
            }.freeze

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end

            def metaLozalizationPath
              @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/auth/localizations/meta/#{lang}.json"
            end

            def render
              {
                visitor: true,
                user: true,
                'user/auth': true,
              }
            end

            def links
              {
                'current/pl': ::SkillfindTech::Api::Tracks::User::Auth::Linker.new(:pl).call,
                'current/en': ::SkillfindTech::Api::Tracks::User::Auth::Linker.new(:en).call,
              }
            end
          end
        end
      end
    end
  end
end
