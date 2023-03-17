# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Page
        module Index
          class Linker < ::Api::Tracks::Page::Index::Linker
            include ::MapawynajmuPl::Api::Tracks::Page::Index::Meta
            include ::MapawynajmuPl::ProtocolAndDomain
          end
        end
      end
    end
  end
end
