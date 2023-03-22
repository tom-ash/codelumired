# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module Contact
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Meta

            private

            def texts
              {
                pl: {
                  companyName: 'Warsaw Digital Sp. z o.o.',
                  companyStreetAndStreetNumber: 'ul. Twarda 18',
                  companyPostalCodeAndCity: '00-105 Warszawa',
                  companyEmail: 'kontakt@mapawynajmu.pl',
                },
                en: {
                  companyName: 'Warsaw Digital Sp. z o.o.',
                  companyStreetAndStreetNumber: 'Twarda 18 St.',
                  companyPostalCodeAndCity: '00-105 Warsaw',
                  companyEmail: 'contact@mapawynajmu.pl',
                },
              }[lang]
            end
          end
        end
      end
    end
  end
end
