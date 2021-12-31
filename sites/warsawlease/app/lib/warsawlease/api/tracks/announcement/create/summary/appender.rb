# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Create
          module Summary
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::MapawynajmuPl::Api::Tracks::Announcement::Create::Summary::Meta

              private

              def merge_state
                state.merge!(
                  'announcement/create/data': {
                    announcement: ::MapawynajmuPl::Serializers::Announcement::Show.new(announcement).call.merge(
                      path: announcement.url(lang),
                      title: announcement.title(lang)
                    )
                  }
                )
              end
            end
          end
        end
      end
    end
  end
end
