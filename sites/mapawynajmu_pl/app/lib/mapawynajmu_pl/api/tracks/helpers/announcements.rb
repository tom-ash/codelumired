# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Helpers
        module Announcements
          private

          def announcements
            @announcements ||= ::MapawynajmuPl::Queries::Announcement::Index::Visitor.new(
              partner: current_partner,
              category: current_category,
              **filters,
            ).call
          end

          def serialized_announcements
            localized_partner_path = current_partner.present? ? "#{current_partner_path(lang)}/" : ''

            @serialized_announcements ||= ::MapawynajmuPl::Serializers::Announcement::Index::Visitor.new(
              announcements: announcements,
              lang: lang,
              current_partner_path: localized_partner_path,
            ).call
          end
        end
      end
    end
  end
end
