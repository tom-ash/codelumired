# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Common
          module Form
            NO_ERROR = { pl: '', en: '' }.freeze

            private

            def listing_form_texts
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
                  addPromotionCheckboxLabel: 'Wyróżnij ogłoszenie za 19 PLN',
                  promotionBenefits: [
                    {
                      item: 'Pierwszeństwo na liście',
                      explanation: 'wyróżnione ogłoszenia prezentowane są na liście przed ogłoszeniami zwykłymi'
                    },
                    {
                      item: 'Zwiększona widoczność na mapie',
                      explanation: 'pinezki wyróżnionych ogłoszeń prezentowane są na mapie ponad pinezkami ogłoszeń zwykłych'
                    },
                    {
                      item: 'Lepsza Prezentacja',
                      explanation: 'wyróżnione ogłoszenia podświetlone są na złoto na liście i na mapie'
                    },
                  ]
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
                  addPromotionCheckboxLabel: 'Promote the listing for 19 PLN',
                  promotionBenefits: [
                    {
                      item: 'Priority on the list',
                      explanation: 'promoted listings are presented on the list before regular ones'
                    },
                    {
                      item: 'Increased visibility on the map',
                      explanation: 'pins of promoted listings are displayed on the map above pins of regular ones'
                    },
                    {
                      item: 'Better Presentation',
                      explanation: 'promoted listings are highlighted in gold on the list and on the map'
                    },
                  ],
                },
              }[lang]
            end

            def listing_form_inputs
              {
                floorSelectOptions: floorSelectOptions,
                totalFloorsSelectOptions: totalFloorsSelectOptions,
                roomsSelectOptions: roomsSelectOptions,
                rentCurrencySelectOptions: rentCurrencyOptions,
              }
            end

            def listing_form_errors
              {
                category: NO_ERROR,
                map: NO_ERROR,
                pictures: NO_ERROR,
              }
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

            def roomsSelectOptions
              [
                { value: '', text: '' },
              ].concat(numberOptions)
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
