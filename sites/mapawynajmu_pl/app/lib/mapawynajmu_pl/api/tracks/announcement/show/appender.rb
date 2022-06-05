# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Show
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::Announcement::Show::Meta

            private

            def merge_state
              state.merge!(
                'announcement/show/data': ::MapawynajmuPl::Serializers::Announcement::Show.new(announcement).call
              )
            end

            def announcement
              @announcement ||= ::MapawynajmuPl::Queries::Announcement::ById.new(id: announcement_id).call
            end

            def announcement_id
              @announcement_id ||= attrs[:url].match(/(\d+)-.*-(na-wynajem|for-lease).*$/)[1]
            end
          end
        end
      end
    end
  end
end
