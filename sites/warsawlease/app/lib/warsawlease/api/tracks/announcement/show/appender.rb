# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Show
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::Warsawlease::Api::Tracks::Announcement::Show::Meta

            def call
              merge_state
              merge_meta
            end

            private

            def merge_state
              state.merge!(
                'announcement/show/data': ::Warsawlease::Serializers::Announcement::Show.new(announcement).call,
                render: render,
                links: links
              )
            end

            def merge_meta
              meta.merge!(
                title: announcement.title(lang),
                keywords: announcement.keywords(lang),
                description: announcement.description(lang),
                image: announcement.image,
                canonical_url: url
              )
            end

            def announcement
              @announcement ||= ::Warsawlease::Queries::Announcement::ById.new(id: announcement_id).call
            end

            def announcement_id
              @announcement_id ||= attrs[:url].match(/(\d+)-.*-(na-wynajem-warszawa|for-lease-warsaw)-.*$/)[1]
            end
          end
        end
      end
    end
  end
end
