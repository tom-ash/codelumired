# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Index
        class Linker
          include ::Api::Tracks::Helpers::Linker
          include ::Api::Tracks::Page::Index::Meta
        end
      end
    end
  end
end
