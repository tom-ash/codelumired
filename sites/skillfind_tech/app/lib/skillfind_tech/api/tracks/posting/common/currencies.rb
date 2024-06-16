# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Common
          module Currencies
            CURRENCIES = [
              {
                value: 'pln',
                text: 'PLN',
              },
              {
                value: 'eur',
                text: 'EUR',
              },
              {
                value: 'usd',
                text: 'USD',
              },
            ]

            private

            def getCurrency(currencyValue)
              curr = CURRENCIES.detect do |currency|
                currency[:value] == currencyValue
              end

              curr[:text]
            end
          end
        end
      end
    end
  end
end
