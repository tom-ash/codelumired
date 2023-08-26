# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Common
          module Form
            include ::MapawynajmuPl::Api::Tracks::Listing::Common::Promotion

            NO_ERROR = { pl: '', en: '' }.freeze

            private

            def listing_form_texts
              getTexts('sites/mapawynajmu_pl/app/lib/mapawynajmu_pl/api/tracks/listing/common/form_texts.json')[lang].merge(promotion_texts)
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
