# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Catalogue
          class Appender < ::Warsawlease::Api::Tracks::Root::Appender
            include ::Warsawlease::Api::Tracks::Announcement::Catalogue::Meta
          end
        end
      end
    end
  end
end
