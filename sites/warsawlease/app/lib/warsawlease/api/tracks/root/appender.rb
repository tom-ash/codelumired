# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Root
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Warsawlease::Api::Tracks::Root::Meta
          include ::Warsawlease::Api::Announcement::Tracks::Helpers::Announcements
          include ::Warsawlease::Api::Announcement::Tracks::Helpers::Filters

          def call
            merge_state
            super
          end

          private

          def merge_state
            state.merge!(
              'announcement/index/data': data,
              'announcement/index/inputs': inputs
            )
          end

          def data
            {
              announcements: serialized_announcements,
              amount: serialized_announcements.count,
              current_category: nil
            }
          end
        end
      end
    end
  end
end
