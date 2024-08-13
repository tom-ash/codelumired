# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Root
        module Meta
          include ::Helpers::MetaLocalizations

          TRACK = 'root'

          UNLOCALIZED_PATH = {
            en: '/',
            pl: 'pl',
          }.freeze

          private

          def track
            @track ||= TRACK
          end

          def unlocalized_path
            @unlocalized_path ||= UNLOCALIZED_PATH
          end

          def metaLozalizationPath
            @metaLozalizationPath ||= "sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/root/localizations/meta/#{lang}.json"
          end

          def render
            {
              visitor: true,
              postings: true,
              'postings/index': true,
              renderVisitorPageIndex: true,
            }
          end

          def links
            {
              'current/en': ::SkillfindTech::Api::Tracks::Root::Linker.new(:en).call,
              'current/pl': ::SkillfindTech::Api::Tracks::Root::Linker.new(:pl).call,
            }
          end
        end
      end
    end
  end
end
