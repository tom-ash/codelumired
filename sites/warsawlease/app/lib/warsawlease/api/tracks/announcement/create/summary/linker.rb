# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Create
          module Summary
            class Linker
              include ::Warsawlease::Api::Tracks::Helpers::Linker
              include ::Warsawlease::Api::Tracks::Announcement::Create::Summary::Meta
            end
          end
        end
      end
    end
  end
end
