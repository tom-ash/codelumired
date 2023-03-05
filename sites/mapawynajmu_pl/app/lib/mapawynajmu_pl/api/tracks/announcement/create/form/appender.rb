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
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::State::Texts
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::State::Inputs
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::State::Errors

              NO_ERROR = { pl: '', en: '' }.freeze
              EMPTY_TEXT = ''
              EMPTY_ARRAY = [].freeze

              private

              def texts
                {
                  # TODO
                }.merge(user_form_texts)
              end

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
                  name: nil,
                  link: nil,
                }.merge(user_form_inputs)
              end

              def errors
                {
                  category: NO_ERROR,
                  map: NO_ERROR,
                  pictures: NO_ERROR,
                }.merge(user_form_errors)
              end
            end
          end
        end
      end
    end
  end
end
