# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
          include ::MapawynajmuPl::Api::Tracks::Root::Assets
          include ::MapawynajmuPl::Api::Tracks::Root::Meta
          include ::MapawynajmuPl::Api::Tracks::Helpers::Listings
          include ::MapawynajmuPl::Api::Tracks::Helpers::Filters
          include ::MapawynajmuPl::Api::Tracks::Listing::Common::Filters

          private

          def texts
            listing_filter_texts
          end

          def control
            {
              isPinsDrawn: false,
            }.merge(filter_control)
          end

          def data
            # byebug
            data_hash = {
              current_category: category_from_path,
              current_partner_name: partner_from_path&.business_name,
              title: title,
              tile: nil,
              announcements: serialized_announcements,
              amount: serialized_announcements.count,
            }.merge(filter_data)

            # if ssr? || attrs[:listings_obsolete]
            #   data_hash.merge!(
            #     announcements: serialized_announcements,
            #     amount: serialized_announcements.count,
            #   )
            # end

            data_hash
          end

          def inputs
            filter_inputs
          end
        end
      end
    end
  end
end
