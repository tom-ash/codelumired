# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Show
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::Announcement::Show::Meta
            include ::MapawynajmuPl::Api::Tracks::Announcement::Show::Assets
            include ::MapawynajmuPl::Api::Tracks::Helpers::Announcements
            include ::MapawynajmuPl::Api::Tracks::Helpers::Filters

            private

            def merge_state
              state.merge!(
                'announcement/index/data': data,
                'announcement/index/control': {
                  current_tile_id: announcement_id,
                  reload_pins: true,
                  map_options: {
                    center: {
                      lat: announcement.latitude,
                      lng: announcement.longitude,
                    },
                    zoom: 12.4,
                  },
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
              # byebug
              data_hash = {
                current_category: current_category,
                tile: serialized_announcement,
              }

              if ssr?
                data_hash.merge!(
                  announcements: serialized_announcements,
                  amount: serialized_announcements.count,
                )
              end

              data_hash
            end
          end
        end
      end
    end
  end
end
