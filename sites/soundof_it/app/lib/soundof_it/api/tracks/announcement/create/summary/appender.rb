# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Announcement
        module Create
          module Summary
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::SoundofIt::Api::Tracks::Announcement::Create::Summary::Meta
            end
          end
        end
      end
    end
  end
end
