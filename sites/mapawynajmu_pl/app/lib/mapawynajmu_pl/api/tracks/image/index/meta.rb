# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Image
        module Index
          module Meta
            include ::Api::Tracks::Image::Index::Meta

            def links
              {
                'current/pl': ::MapawynajmuPl::Api::Tracks::Image::Index::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::Image::Index::Linker.new(:en).call,
              }
            end
          end
        end
      end
    end
  end
end
