# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module New
        module Meta
          TRACK = 'page/create'

          UNLOCALIZED_PATH = {
            pl: 'dodaj-strone',
            en: 'add-page'
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: 'Dodaj stronę',
            en: 'Add page'
          }.freeze

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

          def unlocalized_keywords
            @unlocalized_keywords ||= {
              pl: 'TODO',
              en: 'TODO'
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              pl: 'TODO',
              en: 'TODO'
            }.freeze
          end

          def render
            {
              visitor: true,
              page: true,
              'page/create': true
            }
          end

          def links
            {
              'current/pl': ::Api::Tracks::Page::New::Linker.new(:pl).call,
              'current/en': ::Api::Tracks::Page::New::Linker.new(:en).call
            }
          end
        end
      end
    end
  end
end
