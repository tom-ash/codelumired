# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::SoundofIt::Api::Tracks::Announcement::Create::Form::Meta

              # TODO!
            end
          end
        end
      end
    end
  end
end
