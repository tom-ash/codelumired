# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Index
          module User
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::Warsawlease::Api::Tracks::Announcement::Index::User::Meta
            end
          end
        end
      end
    end
  end
end
