# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Index
        class Linker
          include ::Api::Tracks::Helpers::Linker
          include ::Api::Tracks::Image::Index::Meta
        end
      end
    end
  end
end
