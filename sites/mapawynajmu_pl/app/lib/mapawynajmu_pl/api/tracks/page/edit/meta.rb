# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Page
        module Edit
          module Meta
            include ::Api::Tracks::Page::Edit::Meta

            def links
              {
                'current/pl': ::MapawynajmuPl::Api::Tracks::Page::Edit::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::Page::Edit::Linker.new(:en).call,
              }
            end
          end
        end
      end
    end
  end
end
