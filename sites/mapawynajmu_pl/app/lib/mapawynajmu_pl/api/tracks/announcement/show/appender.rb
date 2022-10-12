# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Show
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::Announcement::Show::Meta
            include ::MapawynajmuPl::Api::Tracks::Helpers::Announcements
            include ::MapawynajmuPl::Api::Tracks::Helpers::Filters

            private

            def merge_state
              state.merge!(
                # 'announcement/show/data': serialized_announcement,
                'announcement/index/data': data,
                'announcement/index/control': {
                  current_tile_id: announcement_id,
                },
              )
            end

            def serialized_announcement
              @serialized_announcement ||= ::MapawynajmuPl::Serializers::Announcement::Show.new(announcement).call.merge(title: title)
            end

            def announcement
              @announcement ||= ::MapawynajmuPl::Queries::Announcement::ById.new(id: announcement_id).call
            end

            def announcement_id
              @announcement_id ||= attrs[:url].match(/(\d+)-.*-(na-wynajem|for-(rent|lease)).*$/)[1]
            end

            def data
              {
                announcements: serialized_announcements,
                amount: serialized_announcements.count,
                current_category: category,
                tile: serialized_announcement,
              }
            end
          end
        end
      end
    end
  end
end
