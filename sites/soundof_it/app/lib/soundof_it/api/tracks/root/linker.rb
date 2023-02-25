# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Root
        class Linker
          include ::SoundofIt::Api::Tracks::Helpers::Linker
          include ::SoundofIt::Api::Tracks::Root::Meta

          private

          def href
            super.chomp('/')
          end
        end
      end
    end
  end
end
