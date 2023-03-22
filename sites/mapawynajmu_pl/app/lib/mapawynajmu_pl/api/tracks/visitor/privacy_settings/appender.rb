# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module PrivacySettings
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Meta

            private

            def texts
              {
                pl: {
                  headingOne: 'Ustawienia prywatności',
                  statisticsConsent: 'Czy zgadzasz się na przetwarzanie Twoich danych osobowych przez Administratora Serwisu, czyli Warsaw Digital Sp. z. o.o., z siedzibą w Warszawie, i jego Zaufanych Partnerów, na zasadach i warunkach przewidzianych w Polityce Prywatności w celu prowadzenia statystyki przez Administratora i jego Zaufanych Partnerów?',
                  marketingConsent: 'Czy zgadzasz się na przetwarzanie Twoich danych osobowych przez Administratora Serwisu, czyli Warsaw Digital Sp. z. o.o., z siedzibą w Warszawie, i jego Zaufanych Partnerów, na zasadach i warunkach przewidzianych w Polityce Prywatności w celu dostosowywani treści marketingowych przez Administratora i jego Zaufanych Partnerów?',
                },
                en: {
                  headingOne: 'Privacy Settings',
                  statisticsConsent: 'Do you agree to processing of your personal data by the Service\'s Administrator, that is Warsaw Digital Sp. z o.o., with its registered office in Warsaw, and its Trusted Partners, pursuant to the terms and conditions envisioned by the Privacy Policy, with the purpose of maintaing statistics by the Administrator and its Trusted Partners?',
                  marketingConsent: 'Do you agree to processing of your personal data by the Service\'s Administrator, that is Warsaw Digital Sp. z o.o., with its registered office in Warsaw, and its Trusted Partners, pursuant to the terms and conditions envisioned by the Privacy Policy, with the purpose of adjusting of marketing content by the Administrator and its Trusted Partners?',
                },
              }[lang]
            end
          end
        end
      end
    end
  end
end
