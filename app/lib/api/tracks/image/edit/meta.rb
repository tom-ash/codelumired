# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Edit
        module Meta
          TRACK = 'image/edit'

          UNLOCALIZED_PATH = {
            pl: %r{^obrazy/.+$},
            en: %r{^images/.+$}
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: 'Edytuj obraz',
            en: 'Edit Image'
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
              image: true,
              'image/edit': true
            }
          end

          def links
            {
              'current/pl': { path: image.edit_link(:pl) },
              'current/en': { path: image.edit_link(:en) }
            }
          end
        end
      end
    end
  end
end
