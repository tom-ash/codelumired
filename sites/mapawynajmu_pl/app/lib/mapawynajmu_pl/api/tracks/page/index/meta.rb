# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Page
        module Index
          module Meta
            include ::Api::Tracks::Page::Index::Meta

            def links
              {
                'current/pl': ::MapawynajmuPl::Api::Tracks::Page::Index::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::Page::Index::Linker.new(:en).call,
              }
            end
          end
        end
      end
    end
  end
end
