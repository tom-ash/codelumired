# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Meta

              NO_ERROR = { pl: '', en: '' }.freeze
              EMPTY_TEXT_INPUT = ''
              EMPTY_ARRAY_INPUT = [].freeze

              private

              def control
                {
                  step: 'form',
                  isMapInitialized: false,
                  shouldInitializeMap: false,
                  addingPicture: false,
                  savingAnnouncement: false,
                  savingPicture: false,
                }
              end

              def inputs
                {
                  id: nil,
                  category: EMPTY_TEXT_INPUT,
                  latitude: nil,
                  longitude: nil,
                  locality: nil,
                  sublocality: nil,
                  blobs: EMPTY_ARRAY_INPUT,
                  picFiles: EMPTY_ARRAY_INPUT,
                  picUploads: EMPTY_ARRAY_INPUT,
                  area: EMPTY_TEXT_INPUT,
                  netRentAmount: EMPTY_TEXT_INPUT,
                  grossRentAmount: EMPTY_TEXT_INPUT,
                  rentCurrency: 0,
                  availabilityDate: nil,
                  rooms: EMPTY_TEXT_INPUT,
                  floor: EMPTY_TEXT_INPUT,
                  totalFloors: EMPTY_TEXT_INPUT,
                  addFeatures: false,
                  features: EMPTY_ARRAY_INPUT,
                  addFurnishings: false,
                  furnishings: EMPTY_ARRAY_INPUT,
                  showPolishDescription: false,
                  polishDescription: EMPTY_TEXT_INPUT,
                  showEnglishDescription: false,
                  englishDescription: EMPTY_TEXT_INPUT,
                  verificationCode: EMPTY_TEXT_INPUT,
                  name: nil,
                  link: nil,
                  account_type: 'private',
                  businessName: EMPTY_TEXT_INPUT,
                  emailAddress: EMPTY_TEXT_INPUT,
                  password: EMPTY_TEXT_INPUT,
                  countryCode: '+48',
                  phoneNumber: EMPTY_TEXT_INPUT,
                  termsAndPrivacyConsent: false,
                }
              end

              def errors
                {
                  category: NO_ERROR,
                  map: NO_ERROR,
                  pictures: NO_ERROR,
                  businessName: NO_ERROR,
                  emailAddress: NO_ERROR,
                  password: NO_ERROR,
                  phoneNumber: NO_ERROR,
                  termsAndPrivacyConsent: NO_ERROR,
                }
              end
            end
          end
        end
      end
    end
  end
end
