# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Show
          module Meta
            TRACK = 'announcement/show'

            UNLOCALIZED_PATH = {
              pl: /^\/?\d+-.*-na-wynajem.*$/,
              en: /^\/?\d+-.*-for-lease.*$/
            }.freeze

            private

            def render
              {
                visitor: true,
                announcement: true,
                'announcement/show': true
              }
            end

            def links
              {
                'current/pl': MapawynajmuPl::Api::Tracks::Announcement::Show::Linker.new(announcement: announcement, lang: :pl).call,
                'current/en': MapawynajmuPl::Api::Tracks::Announcement::Show::Linker.new(announcement: announcement, lang: :en).call
              }
            end

            def asset_names
              @asset_names ||= %i[check facebook phone]
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
