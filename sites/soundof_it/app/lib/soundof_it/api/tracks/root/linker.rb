# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Root
        class Linker
          include ::Api::Tracks::Helpers::Linker
          include ::SoundofIt::Api::Tracks::Root::Meta
        end
      end
    end
  end
end
