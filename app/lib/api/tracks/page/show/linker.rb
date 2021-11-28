# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Show
        class Linker
          include ::Api::Tracks::Helpers::Linker
          include ::Api::Tracks::Page::Show::Meta
        end
      end
    end
  end
end
