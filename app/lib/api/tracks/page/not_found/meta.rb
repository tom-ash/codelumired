# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module NotFound
        module Meta
          TRACK = 'page/not-found'

          private

          def unlocalized_title
            {
              pl: 'Nie znaleziono',
              en: 'Not Found',
            }
          end

          def unlocalized_description
            {
              pl: 'Żądana strona nie została odnaleziona.',
              en: 'The requested page has not been found.',
            }
          end

          def unlocalized_keywords
            {
              pl: 'nie znaleziono',
              en: 'not found',
            }
          end

          def render
            {
              page: true,
              'page/not-found': true,
            }
          end

          def links
            {
              'current/pl': { href: url, title: 'Nie znaleziono' },
              'current/en': { href: url, title: 'Not Found' },
            }
          end
        end
      end
    end
  end
end
