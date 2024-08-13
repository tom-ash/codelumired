# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module CookiesPolicy
          module Meta
            include ::Helpers::MetaLocalizations

            TRACK = 'visitor/cookies-policy'

            UNLOCALIZED_PATH = {
              en: 'cookies-policy',
              pl: 'polityka-cookies',
            }.freeze

            UNLOCALIZED_TITLE = {
              en: 'Cookies Policy',
              pl: 'Polityka Cookies',
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
              @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/visitor/cookies_policy/localizations/meta/#{lang}.json"
            end

            def render
              {
                'visitor': true,
                'visitor/cookies-policy': true,
              }
            end

            def links
              {
                'current/en': ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
