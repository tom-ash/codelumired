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

            private

            def control
              {
                step: 'form',
                shouldInitializeMap: false,
                isMapInitialized: false,
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
                announcement: ::MapawynajmuPl::Serializers::Announcement::Show.new(announcement).call,
              }
            end

            def errors
              {
                category: NO_ERROR,
                map: NO_ERROR,
                pictures: NO_ERROR,
              }
            end

            # def inputs
            #   id: '',
            #   category: '',
            #   rentCurrency: 0,
            #   netRentAmount: '',
            #   grossRentAmount: '',
            #   area: '',
            #   rooms: '',
            #   availabilityDate: null,
            #   floor: '',
            #   totalFloors: '',
            #   blobs: [],
            #   picFiles: [],
            #   picUploads: [],
            #   addFeatures: false,
            #   features: parseFeaturesForState(),
            #   addFurnishings: false,
            #   furnishings: parseFurnishingsForState(),
            #   showPolishDescription: false,
            #   polishDescription: '',
            #   showEnglishDescription: false,
            #   englishDescription: '',
            #   latitude: null,
            #   longitude: null,
            #   verificationCode: '',
            #   locality: null,
            #   sublocality: null,
            #   name: null,
            #   link: null,
            # end

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
