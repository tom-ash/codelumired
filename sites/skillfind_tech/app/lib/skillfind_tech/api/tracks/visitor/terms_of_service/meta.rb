# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          module Meta
            include ::Helpers::MetaLocalizations

            TRACK = 'visitor/terms-of-service'

            UNLOCALIZED_PATH = {
              en: 'terms-of-service',
              pl: 'regulamin',
            }.freeze

            UNLOCALIZED_TITLE = {
              en: 'Terms of Service',
              pl: 'Regulamin',
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
              @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/visitor/terms_of_service/localizations/meta/#{lang}.json"
            end

            def render
              {
                visitor: true,
                'visitor/terms-of-service': true
              }
            end

            def links
              {
                'current/en': ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
