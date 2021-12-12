# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Edit
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::Warsawlease::Api::Tracks::Announcement::Edit::Meta

            private

            def merge_state
              state.merge!(
                'announcement/create/data': {
                  announcement: ::Warsawlease::Serializers::Announcement::Show.new(announcement).call
                }
              )
            end

            def merge_meta
              meta.merge!(
                title: announcement.edit_title(lang)
              )
            end

            def serialized_announcement
              ::Warsawlease::Serializers::Announcement::Edit.new(announcement).call
            end

            def announcement
              @announcement ||= ::Warsawlease::Queries::Announcement::ById.new(id: announcement_id).call
            end

            def announcement_id
              @announcement_id = attrs[:url].match(%r{(edytuj-ogloszenie|edit-announcement)/(\d+)})[2]
            end
          end
        end
      end
    end
  end
end
