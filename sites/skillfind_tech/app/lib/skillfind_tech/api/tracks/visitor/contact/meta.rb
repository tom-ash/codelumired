# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module Contact
          module Meta
            include ::Helpers::MetaLocalizations

            TRACK = 'visitor/contact'

            UNLOCALIZED_PATH = {
              en: 'contact',
              pl: 'kontakt',
            }.freeze

            PRIORITY = '0.8'

            CHANGE_FREQ = 'monthly'

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end

            def metaLozalizationPath
              @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/visitor/contact/localizations/meta/#{lang}.json"
            end

            def render
              {
                'visitor': true,
                'visitor/contact': true,
              }
            end

            def links
              {
                'current/en': ::SkillfindTech::Api::Tracks::Visitor::Contact::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Visitor::Contact::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
