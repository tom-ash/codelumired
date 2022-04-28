# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Index
        module Meta
          TRACK = 'page/index'

          UNLOCALIZED_PATH = {
            pl: 'strony',
            en: 'pages'
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: 'Strony',
            en: 'Pages'
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
              pl: 'strony',
              en: 'pages'
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              pl: 'Strony.',
              en: 'Pages.'
            }.freeze
          end

          def render
            {
              visitor: true,
              page: true,
              'page/index': true
            }
          end

          def links
            {
              'current/pl': ::Api::Tracks::Page::Index::Linker.new(:pl).call,
              'current/en': ::Api::Tracks::Page::Index::Linker.new(:en).call
            }
          end
        end
      end
    end
  end
end
