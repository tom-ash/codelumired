# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Create
          module Form
            class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
              include ::MapawynajmuPl::Api::Tracks::Listing::Create::Form::Meta
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::State::Texts
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::State::Inputs
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::State::Errors
              include ::MapawynajmuPl::Api::Tracks::Listing::Common::Form

              EMPTY_TEXT = ''
              EMPTY_ARRAY = [].freeze

              private

              def texts
                listing_form_texts.merge(user_form_texts)
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

              def inputs
                {
                  id: nil,
                  category: EMPTY_TEXT,
                  latitude: nil,
                  longitude: nil,
                  locality: nil,
                  sublocality: nil,
                  blobs: EMPTY_ARRAY,
                  picFiles: EMPTY_ARRAY,
                  picUploads: EMPTY_ARRAY,
                  area: EMPTY_TEXT,
                  netRentAmount: EMPTY_TEXT,
                  grossRentAmount: EMPTY_TEXT,
                  rentCurrency: 0,
                  availabilityDate: nil,
                  rooms: EMPTY_TEXT,
                  floor: EMPTY_TEXT,
                  totalFloors: EMPTY_TEXT,
                  addFeatures: false,
                  features: EMPTY_ARRAY,
                  addFurnishings: false,
                  furnishings: EMPTY_ARRAY,
                  showPolishDescription: false,
                  polishDescription: EMPTY_TEXT,
                  showEnglishDescription: false,
                  englishDescription: EMPTY_TEXT,
                  verificationCode: EMPTY_TEXT,
                  name: EMPTY_TEXT,
                  link: EMPTY_TEXT,
                  add_promotion: false,
                }.merge(listing_form_inputs, user_form_inputs)
              end

              def errors
                listing_form_errors.merge(user_form_errors)
              end
            end
          end
        end
      end
    end
  end
end
