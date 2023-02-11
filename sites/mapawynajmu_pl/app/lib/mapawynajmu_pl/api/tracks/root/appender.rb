# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::MapawynajmuPl::Api::Tracks::Root::Assets
          include ::MapawynajmuPl::Api::Tracks::Root::Meta
          include ::MapawynajmuPl::Api::Tracks::Helpers::Announcements
          include ::MapawynajmuPl::Api::Tracks::Helpers::Filters

          private

          def control
            {
              isMapInitialized: false,
              isMapInitializedAaa: false, 
              shouldInitializeMap: false,
              isPinsDrawn: false,
              mapOptions: {
                center: {
                  lat: 52,
                  lng: 19,
                },
                zoom: 6.7,
              },
            }
          end

          def data
            data_hash = {
              current_category: current_category,
              current_partner_name: current_partner&.business_name,
              title: title,
              tile: nil,
              announcements: serialized_announcements,
              amount: serialized_announcements.count,
            }

            # if ssr? || attrs[:listings_obsolete]
            #   data_hash.merge!(
            #     announcements: serialized_announcements,
            #     amount: serialized_announcements.count,
            #   )
            # end

            data_hash
          end
        end
      end
    end
  end
end
