# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module New
        class Linker
          include ::Api::Tracks::Helpers::Linker
          include ::Api::Tracks::Page::New::Meta
        end
      end
    end
  end
end
