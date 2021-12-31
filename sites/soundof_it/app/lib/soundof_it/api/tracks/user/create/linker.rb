# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module User
        module Create
          class Linker
            include SoundofIt::Api::Tracks::Helpers::Linker
            include SoundofIt::Api::Tracks::Root::Meta
          end
        end
      end
    end
  end
end
