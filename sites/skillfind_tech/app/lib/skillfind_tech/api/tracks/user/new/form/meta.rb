# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Form
            module Meta
              include ::Helpers::MetaLocalizations

              TRACK = 'user/new/form'

              UNLOCALIZED_PATH = {
                pl: 'zarejestruj',
                en: 'sign-up',
              }.freeze

              UNLOCALIZED_TITLE = {
                pl: 'Zarejestruj',
                en: 'Sign Up',
              }.freeze

              private

              def track
                @track ||= TRACK
              end

              def unlocalized_path
                @unlocalized_path ||= UNLOCALIZED_PATH
              end

              def metaLozalizationPath
                @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/new/form/localizations/meta/#{lang}.json"
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
                  'current/pl': ::SkillfindTech::Api::Tracks::User::New::Form::Linker.new(:pl).call,
                  'current/en': ::SkillfindTech::Api::Tracks::User::New::Form::Linker.new(:en).call,
                }
              end

              def asset_names
                @asset_names ||= %i[chevron camera close rotate]
              end
            end
          end
        end
      end
    end
  end
end
