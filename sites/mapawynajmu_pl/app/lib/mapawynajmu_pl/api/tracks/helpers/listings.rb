# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Helpers
        module Listings
          private

          def announcements
            @announcements ||= ::MapawynajmuPl::Queries::Listing::Index::Visitor.new(
              partner: partner_from_path,
              category: category_from_path,
              **filters,
            ).call
          end

          def serialized_announcements
            @serialized_announcements ||= ::MapawynajmuPl::Serializers::Listing::Index::Visitor.new(
              announcements: announcements,
              lang: lang,
              path: get_localized_path_prefix(category_from_path, lang),
            ).call
          end
        end
      end
    end
  end
end
