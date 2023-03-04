# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            module State
              NO_ERROR = { pl: '', en: '' }.freeze
              EMPTY_TEXT_INPUT = ''

              private

              def texts
                {
                  pl: {
                    emailInputLabel: 'Adres email',
                    emailInputPlaceholder: 'Podaj adres email',
                    emailInvalidError: 'Nieprawidłowy adres email.',
                  },
                  en: {
                    emailInputLabel: 'Email Address',
                    emailInputPlaceholder: 'Provide email address',
                    emailInvalidError: 'Invalid email address.',
                  },
                }[lang]
              end

              def inputs
                {
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
                  businessName: NO_ERROR,
                  emailAddress: false,
                  password: NO_ERROR,
                  phoneNumber: NO_ERROR,
                  termsAndPrivacyConsent: NO_ERROR,
                  verification: NO_ERROR,
                }
              end
            end
          end
        end
      end
    end
  end
end
