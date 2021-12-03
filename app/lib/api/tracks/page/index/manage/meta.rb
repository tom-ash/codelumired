# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Index
        module Manage
          module Meta
            TRACK = 'page/index/manage'

            UNLOCALIZED_PATH = {
              pl: 'zarzadzaj-stronami',
              en: 'manage-pages'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Zarządzaj stronami',
              en: 'Manage pages'
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
                'page/index': true,
                'page/index/manage': true
              }
            end

            def links
              {
                'current/pl': ::Api::Tracks::Page::Index::Manage::Linker.new(:pl).call,
                'current/en': ::Api::Tracks::Page::Index::Manage::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
