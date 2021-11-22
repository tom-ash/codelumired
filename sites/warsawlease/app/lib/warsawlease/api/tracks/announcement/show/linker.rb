# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Show
          class Linker
            include ::Warsawlease::Api::Tracks::Helpers::Linker
            include ::Warsawlease::Api::Tracks::Announcement::Show::Meta
          end
        end
      end
    end
  end
end
