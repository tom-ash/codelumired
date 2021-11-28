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
          end
        end
      end
    end
  end
end
