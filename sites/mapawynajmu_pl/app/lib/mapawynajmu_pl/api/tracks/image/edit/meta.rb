# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Image
        module Edit
          module Meta
            include ::Api::Tracks::Image::Edit::Meta

            def links
              {
                'current/pl': ::MapawynajmuPl::Api::Tracks::Image::Edit::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::Image::Edit::Linker.new(:en).call,
              }
            end
          end
        end
      end
    end
  end
end
