# frozen_string_literal: true

module Api
  module Tracks
    module Helpers
      module Meta
        module OpenGraph
          DEFAULT_OPEN_GRAPH_TYPE = 'website'
          DEFAULT_OPEN_GRAPH_IMAGE_WIDTH = 1200
          DEFAULT_OPEN_GRAPH_IMAGE_HEIGHT = 630

          OPEN_GRAPH_LOCALES = {
            pl: 'pl_PL',
            en: 'en_GB',
          }.freeze

          private

          def open_graph
            {
              **primary_meta,
              site_name: site_name,
              url: full_url,
              type: open_graph_type,
              locale: OPEN_GRAPH_LOCALES[lang],
              'image:width': DEFAULT_OPEN_GRAPH_IMAGE_WIDTH,
              'image:height': DEFAULT_OPEN_GRAPH_IMAGE_HEIGHT,
              locales: locales,
            }
          end

          def open_graph_type
            @open_graph_type ||= DEFAULT_OPEN_GRAPH_TYPE
          end

          def locales
            langs.map do |lang|
              OPEN_GRAPH_LOCALES[lang]
            end
          end
        end
      end
    end
  end
end
