# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            module Texts
              private

              def user_form_texts
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
                    termsOfServiceConsentLabel: termsOfServiceConsentLabel,
                    termsOfServiceConsentSyntheticLabel: termsOfServiceConsentSyntheticLabel,
                    termsOfService: termsOfService,
                    termsOfServiceConsentNotGrantedError: 'Akceptacja Regulaminu jest wymagana.',
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
                    termsOfServiceConsentLabel: termsOfServiceConsentLabel,
                    termsOfServiceConsentSyntheticLabel: termsOfServiceConsentSyntheticLabel,
                    termsOfService: termsOfService,
                    termsOfServiceConsentNotGrantedError: 'The acceptance of the Terms of Service is required.',
                  },
                }[lang]
              end

              def termsOfServiceConsentLabel
                @termsOfServiceConsentLabel ||= termsOfServiceConsentSyntheticLabel.gsub('{termsOfService}', termsOfService)
              end

              def termsOfServiceConsentSyntheticLabel
                @termsOfServiceConsentSyntheticLabel ||= {
                  pl: 'Oświadczam, że znam i akceptuję postanowienia {termsOfService}.',
                  en: 'I declare that I know and accept {termsOfService}.',
                }[lang]
              end

              def termsOfService
                @termsOfService ||= {
                  pl: 'Regulaminu mapawynajmu.pl',
                  en: 'the Terms of Service of mapawynajmu.pl',
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
