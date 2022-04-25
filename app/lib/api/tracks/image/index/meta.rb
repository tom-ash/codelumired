# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Index
        module Meta
          TRACK = 'image/create'

          UNLOCALIZED_PATH = {
            pl: 'dodaj-obraz',
            en: 'add-image'
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: 'Dodaj obraz',
            en: 'Add Image'
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
              pl: 'dodaj, obraz',
              en: 'add, image'
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              pl: 'Dodaj obraz.',
              en: 'Add image.'
            }.freeze
          end

          def render
            {
              visitor: true,
              image: true,
              'image/create': true
            }
          end

          def links
            {
              'current/pl': 'TODO',
              'current/en': 'TODO'
            }
          end
        end
      end
    end
  end
end
