# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module Contact
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Visitor::Contact::Meta

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

            def asset_names
              @asset_names ||= header_asset_names
            end
          end
        end
      end
    end
  end
end
