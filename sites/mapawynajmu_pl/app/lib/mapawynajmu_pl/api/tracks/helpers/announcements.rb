# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Helpers
        module Announcements
          private

          def announcements
            @announcements ||= ::MapawynajmuPl::Queries::Announcement::Index::Visitor.new(
              partner: partner,
              category: category,
              **filters,
            ).call
          end

          def serialized_announcements
            localized_partner_path = partner.present? ? "#{partner_path(lang)}/" : ''

            @serialized_announcements ||= ::MapawynajmuPl::Serializers::Announcement::Index::Visitor.new(
              announcements: announcements,
              lang: lang,
              partner_path: localized_partner_path,
            ).call
          end
        end
      end
    end
  end
end
