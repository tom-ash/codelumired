# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Create
        class Linker
          include ::Api::Tracks::Helpers::Linker
          include ::Api::Tracks::Image::Create::Meta
        end
      end
    end
  end
end
