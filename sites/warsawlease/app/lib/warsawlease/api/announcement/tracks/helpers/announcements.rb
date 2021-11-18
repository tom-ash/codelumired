# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Tracks
        module Helpers
          module Announcements
            private

            def announcements
              @announcements ||= ::Warsawlease::Queries::Announcement::Index::Visitor.new(filters).call
            end

            def serialized_announcements
              @serialized_announcements ||= ::Warsawlease::Serializers::Announcement::Index::Visitor.new(announcements).call
            end
          end
        end
      end
    end
  end
end
