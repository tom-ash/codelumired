# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Edit
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::Announcement::Edit::Meta
            include ::MapawynajmuPl::Api::Tracks::Announcement::Edit::Assets

            NO_ERROR = { pl: '', en: '' }.freeze
            EMPTY_TEXT = ''
            EMPTY_ARRAY = [].freeze

            private

            def control
              {
                step: 'form',
                isMapInitialized: false,
                shouldInitializeMap: false,
                addAvailabilityDate: false, # TODO: Move to data.
                connecting: false,
                publishing: false,
                addingPicture: false,
                savingAnnouncement: false,
                success: false,
              }
            end

            def data
              {
                id: announcement.id,
              }
            end

            def inputs
              {
                category: announcement.category,
                latitude: announcement.latitude,
                longitude: announcement.longitude,
                locality: announcement.locality,
                sublocality: announcement.sublocality,
                blobs: EMPTY_ARRAY,
                picFiles: EMPTY_ARRAY,
                picUploads: EMPTY_ARRAY,
                db_pictures: announcement.pictures,
                area: announcement.area,
                netRentAmount: announcement.net_rent_amount,
                grossRentAmount: announcement.gross_rent_amount,
                rentCurrency: announcement.rent_currency,
                availabilityDate: announcement.availability_date,
                rooms: announcement.rooms,
                floor: announcement.floor,
                totalFloors: announcement.total_floors,
                addFeatures: announcement.features.any?,
                features: announcement.features,
                addFurnishings: announcement.furnishings.any?,
                furnishings: announcement.furnishings,
                showPolishDescription: announcement[:polish_description].present?,
                polishDescription: announcement[:polish_description],
                showEnglishDescription: announcement[:english_description].present?,
                englishDescription: announcement[:english_description],
                name: announcement.name,
                link: announcement.link,
              }
            end

            def errors
              {
                category: NO_ERROR,
                map: NO_ERROR,
                pictures: NO_ERROR,
              }
            end

            def serialized_announcement
              ::MapawynajmuPl::Serializers::Announcement::Edit.new(announcement).call
            end

            def announcement
              @announcement ||= ::MapawynajmuPl::Queries::Announcement::ById.new(id: announcement_id).call
            end

            def announcement_id
              @announcement_id = attrs[:url].match(%r{(edytuj-ogloszenie|edit-announcement)/(\d+)})[2]
            end
          end
        end
      end
    end
  end
end
