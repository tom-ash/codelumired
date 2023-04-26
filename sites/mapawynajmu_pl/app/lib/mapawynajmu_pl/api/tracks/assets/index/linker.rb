# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Assets
        module Index
          class Linker < ::Api::Tracks::Assets::Index::Linker
            include ::MapawynajmuPl::Api::Tracks::Assets::Index::Meta
            include ::MapawynajmuPl::ProtocolAndDomain
          end
        end
      end
    end
  end
end
