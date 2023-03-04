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
                    businessNameInputLabel: 'Nazwa firmy',
                    businessNameInputPlaceholder: 'Podaj nazwę firmy',
                    businessNameInvalidError: 'Nieprawidłowa nazwa firmy.',

                    emailInputLabel: 'Adres email',
                    emailInputPlaceholder: 'Podaj adres email',
                    emailInvalidError: 'Nieprawidłowy adres email.',

                    passwordInputLabel: 'Hasło',
                    passwordInputPlaceholder: 'Podaj hasło',
                    passwordInvalidError: 'Hasło powinno się składać z conajmniej 6 znaków.',

                  },
                  en: {
                    businessNameInputLabel: 'Business Name',
                    businessNameInputPlaceholder: 'Provide business name',
                    businessNameInvalidError: 'Invalid business name.',

                    emailInputLabel: 'Email Address',
                    emailInputPlaceholder: 'Provide email address',
                    emailInvalidError: 'Invalid email address.',

                    passwordInputLabel: 'Password',
                    passwordInputPlaceholder: 'Provide password',
                    passwordInvalidError: 'The password has to consist at least six characters.',

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
                  businessName: false,
                  emailAddress: false,
                  password: false,
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
