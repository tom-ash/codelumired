# frozen_string_literal: true

module Warsawlease
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
                'current/pl': Warsawlease::Api::Tracks::Announcement::Edit::Linker.new(announcement: announcement, lang: :pl).call,
                'current/en': Warsawlease::Api::Tracks::Announcement::Edit::Linker.new(announcement: announcement, lang: :en).call
              }
            end

            def asset_names
              @asset_names ||= %i[camera]
            end
          end
        end
      end
    end
  end
end
