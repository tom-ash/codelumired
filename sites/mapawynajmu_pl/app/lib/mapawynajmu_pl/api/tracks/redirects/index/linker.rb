# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Redirects
        module Index
          class Linker < ::Api::Tracks::Redirects::Index::Linker
            include ::MapawynajmuPl::Api::Tracks::Redirects::Index::Meta
            include ::MapawynajmuPl::ProtocolAndDomain
          end
        end
      end
    end
  end
end
