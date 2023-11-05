# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Index
        module Meta
          TRACK = 'image/index'

          UNLOCALIZED_PATH = {
            pl: 'obrazy',
            en: 'images',
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: 'Obrazy',
            en: 'Images',
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
              pl: 'obrazy',
              en: 'images',
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              pl: 'Obrazy.',
              en: 'Images.',
            }.freeze
          end

          def render
            {
              visitor: true,
              image: true,
              'image/index': true,
            }
          end

          def links
            {
              'current/pl': { href: 'obrazy' },
              'current/en': { href: 'images' },
            }
          end
        end
      end
    end
  end
end
