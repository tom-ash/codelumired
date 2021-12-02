# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Show
          module Meta
            TRACK = 'announcement/show'

            UNLOCALIZED_PATH = {
              pl: /^\/?\d+-.*-na-wynajem-warszawa-.*$/,
              en: /^\/?\d+-.*-for-lease-warsaw-.*$/
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
                'current/pl': Warsawlease::Api::Tracks::Announcement::Show::Linker.new(announcement: announcement, lang: :pl).call,
                'current/en': Warsawlease::Api::Tracks::Announcement::Show::Linker.new(announcement: announcement, lang: :en).call
              }
            end
          end
        end
      end
    end
  end
end
