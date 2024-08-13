# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module PrivacySettings
          module Meta
            include ::Helpers::MetaLocalizations

            TRACK = 'visitor/privacy-settings'

            UNLOCALIZED_PATH = {
              en: 'privacy-settings',
              pl: 'ustawienia-prywatnosci',
            }.freeze

            UNLOCALIZED_TITLE = {
              en: 'Privacy Settings',
              pl: 'Ustawienia prywatności',
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

            def metaLozalizationPath
              @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/visitor/privacy_settings/localizations/meta/#{lang}.json"
            end

            def render
              {
                'visitor': true,
                'visitor/privacy-settings': true,
              }
            end

            def links
              {
                'current/en': ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
