# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Index
        module Visitor
          class Linker
            include ::Api::Tracks::Helpers::Linker
            include ::Api::Tracks::Page::Index::Visitor::Meta
          end
        end
      end
    end
  end
end
