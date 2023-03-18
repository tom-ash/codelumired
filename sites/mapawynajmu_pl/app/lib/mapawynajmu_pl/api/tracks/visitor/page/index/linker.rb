# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module Page
          module Index
            class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
              include ::MapawynajmuPl::Api::Tracks::Visitor::Page::Index::Meta
              include ::MapawynajmuPl::ProtocolAndDomain
            end
          end
        end
      end
    end
  end
end
