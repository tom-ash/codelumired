# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Page
        module Edit
          class Linker < ::Api::Tracks::Page::Edit::Linker
            include ::MapawynajmuPl::Api::Tracks::Page::Edit::Meta
            include ::MapawynajmuPl::ProtocolAndDomain
          end
        end
      end
    end
  end
end
