# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Edit
        class Linker < ::Api::Tracks::Common::Linker
          include ::Api::Tracks::Page::Edit::Meta
        end
      end
    end
  end
end
