# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Helpers
        module Announcements
          private

          def announcements
            @announcements ||= ::MapawynajmuPl::Queries::Announcement::Index::Visitor.new(category: category, **filters).call
          end

          def serialized_announcements
            @serialized_announcements ||= ::MapawynajmuPl::Serializers::Announcement::Index::Visitor.new(announcements, lang).call
          end
        end
      end
    end
  end
end
