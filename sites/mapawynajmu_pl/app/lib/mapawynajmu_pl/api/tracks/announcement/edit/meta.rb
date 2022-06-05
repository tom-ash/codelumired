# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Edit
          module Meta
            TRACK = 'announcement/edit'

            UNLOCALIZED_PATH = {
              pl: %r{^edytuj-ogloszenie/\d+$},
              en: %r{^edit-announcement/\d+$}
            }.freeze

            private

            def render
              {
                visitor: true,
                announcement: true,
                'announcement/create': true,
                'announcement/edit': true
              }
            end

            def links
              {
                'current/pl': MapawynajmuPl::Api::Tracks::Announcement::Edit::Linker.new(announcement: announcement, lang: :pl).call,
                'current/en': MapawynajmuPl::Api::Tracks::Announcement::Edit::Linker.new(announcement: announcement, lang: :en).call
              }
            end

            def asset_names
              @asset_names ||= %i[camera]
            end

            def title
              @title ||= announcement.title(lang)
            end

            def description
              @description ||= announcement.description(lang)
            end

            def keywords
              @keywords ||= announcement.keywords(lang)
            end

            def image
              @image ||= announcement.image
            end
          end
        end
      end
    end
  end
end
