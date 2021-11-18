# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Tracks
        module Root
          class Merge < ::Warsawlease::Api::Announcement::Tracks::Base
            include ::Warsawlease::Api::Announcement::Tracks::Root::Meta
            include ::Warsawlease::Api::Announcement::Tracks::Helpers::Filters
            include ::Warsawlease::Api::Announcement::Tracks::Helpers::Announcements

            def call
              merge_state
              merge_meta
            end

            private

            def merge_state
              state.merge!(
                'announcement/index/data': data,
                'announcement/index/inputs': inputs
              )
            end

            def merge_meta
              meta.merge!(
                title: title,
                keywords: keywords,
                description: description
              )
            end

            def data
              {
                announcements: serialized_announcements,
                amount: announcements.count,
                current_category: nil
              }
            end
          end
        end
      end
    end
  end
end
