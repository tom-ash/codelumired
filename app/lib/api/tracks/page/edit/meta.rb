# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Edit
        module Meta
          TRACK = 'page/edit'

          UNLOCALIZED_PATH = {
            pl: %r{^edytuj-strone/.+$},
            en: %r{^edit-page/.+$}
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: 'Edytuj stronę',
            en: 'Edit Page'
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
              'page/edit': true
            }
          end

          def links
            page_pl = site::Page.find_by(name: page.name, lang: :pl)
            page_en = site::Page.find_by(name: page.name, lang: :en)

            {
              'current/pl': { path: page_pl.edit_link, title: 'Edytuj stronę TODO' },
              'current/en': { path: page_en.edit_link, title: 'Edit Page TODO' }
            }
          end

          def asset_names
            @asset_names ||= page.meta['assets'].split(', ').map(&:to_sym)
          end
        end
      end
    end
  end
end
