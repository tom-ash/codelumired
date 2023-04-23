# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Create
          module Summary
            class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
              include ::MapawynajmuPl::Api::Tracks::Listing::Create::Summary::Meta
            end
          end
        end
      end
    end
  end
end
