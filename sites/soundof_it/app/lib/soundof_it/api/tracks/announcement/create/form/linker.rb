# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Linker
              include ::Api::Tracks::Helpers::Linker
              include ::SoundofIt::Api::Tracks::Announcement::Create::Form::Meta
            end
          end
        end
      end
    end
  end
end
