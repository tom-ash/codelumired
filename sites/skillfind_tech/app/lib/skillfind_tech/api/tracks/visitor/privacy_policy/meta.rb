# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          module Meta
            include ::Helpers::MetaLocalizations

            TRACK = 'visitor/privacy-policy'

            UNLOCALIZED_PATH = {
              en: 'privacy-policy',
              pl: 'polityka-prywatnosci',
            }.freeze

            UNLOCALIZED_TITLE = {
              en: 'Privacy Policy',
              pl: 'Polityka prywatności',
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

            def metaLozalizationPath
              @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/visitor/privacy_policy/localizations/meta/#{lang}.json"
            end

            def render
              {
                'visitor': true,
                'visitor/privacy-policy': true,
              }
            end

            def links
              {
                'current/en': ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
