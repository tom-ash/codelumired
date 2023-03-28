# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
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
                  pl: {
                    categoryHeading: 'Kategoria',
                    categoryInstructions: 'Kliknij w odpowiednią ikonę, aby wybrać kategorię.',
                    areaInputLabel: 'Powierzchnia',
                    areaInputPlaceholder: 'Podaj powierzchnię',
                    linkInputLabel: 'Link',
                    nameInputLabel: 'Nazwa',
                    showPolishDescriptionCheckboxLabel: 'Dodaj Opis w języku polskim',
                    showEnglishDescriptionCheckboxLabel: 'Dodaj Opis w języku angielskim',
                    showAvailabilityDateCheckboxLabel: 'Dodaj datę dostępności',
                    floorSelectLabel: 'Piętro',
                    totalFloorsSelectLabel: 'Liczba pięter budynku',
                    roomsSelectLabel: 'Liczba pokoi',

                    netRentAmountInputLabel: 'Miesięczna cena netto',
                    grossRentAmountInputLabel: 'Miesięczna cena',
                  },
                  en: {
                    categoryHeading: 'Category',
                    categoryInstructions: 'Click the respective icon to select the category.',
                    areaInputLabel: 'Area',
                    areaInputPlaceholder: 'Provide area',
                    linkInputLabel: 'Link',
                    nameInputLabel: 'Name',
                    showPolishDescriptionCheckboxLabel: 'Add Description in Polish Language',
                    showEnglishDescriptionCheckboxLabel: 'Add Description in English Language',
                    showAvailabilityDateCheckboxLabel: 'Add availability date',
                    floorSelectLabel: 'Floor',
                    totalFloorsSelectLabel: 'Building Total Floors',
                    roomsSelectLabel: 'Rooms Amount',

                    netRentAmountInputLabel: 'Monthly Net Price',
                    grossRentAmountInputLabel: 'Monthly Price',
                  },
                }[lang].merge(user_form_texts)
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
                  name: EMPTY_TEXT,
                  link: EMPTY_TEXT,

                  floorSelectOptions: floorSelectOptions,
                  totalFloorsSelectOptions: totalFloorsSelectOptions,
                  roomsSelectOptions: numberOptions,

                  rentCurrencySelectOptions: rentCurrencyOptions,

                }.merge(user_form_inputs)
              end

              def errors
                {
                  category: NO_ERROR,
                  map: NO_ERROR,
                  pictures: NO_ERROR,
                }.merge(user_form_errors)
              end

              def floorSelectOptions
                [
                  { value: '', text: '' },
                  { value: -1, text: 'Podziemie' },
                  { value: 0, text: 'Parter' }
                ].concat(numberOptions)
              end

              def totalFloorsSelectOptions
                [
                  { value: '', text: '' },
                  { value: -1, text: 'Tylko Podziemie' },
                  { value: 0, text: 'Tylko Parter' }
                ].concat(numberOptions)
              end

              def rentCurrencyOptions
                [
                  { value: 0, text: 'zł' },
                  { value: 1, text: '€' },
                  { value: 2, text: '$' },
                ]
              end

              def numberOptions
                Array(1..100).map do |option|
                  {
                    value: option,
                    text: option,
                  }
                end
              end
            end
          end
        end
      end
    end
  end
end
