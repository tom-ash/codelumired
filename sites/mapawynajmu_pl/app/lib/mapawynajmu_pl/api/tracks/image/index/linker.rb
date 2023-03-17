# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Image
        module Index
          class Linker < ::Api::Tracks::Image::Index::Linker
            include ::MapawynajmuPl::Api::Tracks::Image::Index::Meta
            include ::MapawynajmuPl::ProtocolAndDomain
          end
        end
      end
    end
  end
end
