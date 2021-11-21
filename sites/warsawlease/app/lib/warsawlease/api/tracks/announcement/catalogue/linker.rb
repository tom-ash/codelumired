# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Catalogue
          class Linker
            include ::Warsawlease::Api::Tracks::Helpers::Linker
            include ::Warsawlease::Api::Tracks::Announcement::Catalogue::Meta
          end
        end
      end
    end
  end
end
