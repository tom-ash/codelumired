# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Edit
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::Announcement::Edit::Meta

            private

            def merge_state
              state.merge!(
                'announcement/create/data': {
                  announcement: ::MapawynajmuPl::Serializers::Announcement::Show.new(announcement).call
                }
              )
            end

            def serialized_announcement
              ::MapawynajmuPl::Serializers::Announcement::Edit.new(announcement).call
            end

            def announcement
              @announcement ||= ::MapawynajmuPl::Queries::Announcement::ById.new(id: announcement_id).call
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
