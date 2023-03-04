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

                    termsOfServiceConsentCheckboxSyntheticLabel: 'Oświadczam, że znam i akceptuję postanowienia {termsOfService}.',
                    termsOfService: 'Regulaminu mapawynajmu.pl',
                    termsOfServiceConsentNotGrantedError: 'Akceptacja Regulaminu i Polityki Prywatności jest wymagana.',
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

                    termsOfServiceConsentCheckboxSyntheticLabel: 'I declare that I know and accept {termsOfService}.',
                    termsOfService: 'the Terms of Service of mapawynajmu.pl',
                    termsOfServiceConsentNotGrantedError: 'The acceptance of the Terms and Conditions and the Privacy Policy is required.',
                  },
                }[lang]
              end

              # def termsOfServiceConsentCheckboxLabel
              #   texts
              # end

              def inputs
                {
                  account_type: 'private',
                  businessName: EMPTY_TEXT_INPUT,
                  emailAddress: EMPTY_TEXT_INPUT,
                  password: EMPTY_TEXT_INPUT,
                  countryCode: '+48',
                  phoneNumber: EMPTY_TEXT_INPUT,
                  termsOfServiceConsent: false,
                }
              end

              def errors
                {
                  businessName: false,
                  emailAddress: false,
                  password: false,
                  phoneNumber: NO_ERROR,
                  termsOfServiceConsent: false,
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
