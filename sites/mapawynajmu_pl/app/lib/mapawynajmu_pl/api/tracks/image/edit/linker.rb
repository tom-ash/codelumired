# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Image
        module Edit
          class Linker < ::Api::Tracks::Image::Edit::Linker
            include ::MapawynajmuPl::Api::Tracks::Image::Edit::Meta
            include ::MapawynajmuPl::ProtocolAndDomain
          end
        end
      end
    end
  end
end
