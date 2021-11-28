# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Edit
          module Meta
            TRACK = 'announcement/edit'

            UNLOCALIZED_PATH = {
              pl: /^edytuj-ogloszenie\/\d+$/,
              en: /^edit-announcement\/\d+$/
            }.freeze
          end
        end
      end
    end
  end
end
