# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module About
          module Meta
            include ::Helpers::MetaLocalizations

            TRACK = 'visitor/about-skillfind-tech'

            UNLOCALIZED_PATH = {
              en: 'about-skillfind-tech',
              pl: 'pl/o-skillfind-tech',
            }.freeze

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end

            def metaLozalizationPath
              @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/visitor/about/localizations/meta/#{lang}.json"
            end

            def render
              {
                'visitor': true,
                'visitor/about': true,
              }
            end

            def links
              {
                'current/en': ::SkillfindTech::Api::Tracks::Visitor::About::Linker.new(:en).call,
                'current/pl': ::SkillfindTech::Api::Tracks::Visitor::About::Linker.new(:pl).call,
              }
            end
          end
        end
      end
    end
  end
end
