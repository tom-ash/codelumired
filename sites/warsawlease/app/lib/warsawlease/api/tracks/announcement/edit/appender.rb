# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Edit
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::Warsawlease::Api::Tracks::Announcement::Edit::Meta

            def call
              merge_state
              merge_meta
            end

            private

            def merge_state
              state.merge!(
                'announcement/create/data': {
                  announcement: ::Warsawlease::Serializers::Announcement::Show.new(announcement).call
                },
                'links': {
                  current_pl: Warsawlease::Api::Tracks::Announcement::Edit::Linker.new(announcement: announcement, lang: :pl).call,
                  current_en: Warsawlease::Api::Tracks::Announcement::Edit::Linker.new(announcement: announcement, lang: :en).call
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
