# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Edit
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::Listing::Edit::Meta
            include ::MapawynajmuPl::Api::Tracks::Listing::Edit::Assets
            include MapawynajmuPl::Api::Tracks::Listing::Common::Form

            EMPTY_ARRAY = [].freeze

            private

            def texts
              listing_form_texts
            end

            def control
              {
                step: 'form',
                isMapInitialized: false,
                shouldInitializeMap: false,
                addingPicture: false,
                savingListing: false,
                savingPicture: false,
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
                showAvailabilityDate: announcement.availability_date.present?,
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
              }.merge(listing_form_inputs)
            end

            def errors
              listing_form_errors
            end

            def serialized_announcement
              ::MapawynajmuPl::Serializers::Listing::Edit.new(announcement).call
            end

            def announcement
              @announcement ||= ::MapawynajmuPl::Queries::Listing::ById.new(id: announcement_id).call
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
