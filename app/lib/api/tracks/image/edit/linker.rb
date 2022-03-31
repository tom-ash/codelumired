# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Edit
        class Linker
          include ::Api::Tracks::Helpers::Linker
          include ::Api::Tracks::Image::Edit::Meta
        end
      end
    end
  end
end
