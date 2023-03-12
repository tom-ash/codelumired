# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            module State
              module Texts
                private

                def user_form_texts
                  {
                    pl: {
                      headingOne: 'Zarejestruj',
                      businessNameInputLabel: 'Nazwa firmy',
                      businessNameInputPlaceholder: 'Podaj nazwę firmy',
                      businessNameInputInvalidError: 'Nieprawidłowa nazwa firmy.',
                      emailInputLabel: 'Adres email',
                      emailInputPlaceholder: 'Podaj adres email',
                      emailInvalidError: 'Nieprawidłowy adres email.',
                      phoneNumberExplanation: 'Numer telefonu będzie widoczny przy Twoich ogłoszeniach jako dana kontaktowa.',
                      phoneNumberInputLabel: 'Numer telefonu',
                      phoneNumberInputPlaceholder: 'Podaj numer telefonu',
                      phoneNumberInputInvalidError: 'Nieprawidłowy numer telefonu.',
                      passwordInputLabel: 'Hasło',
                      passwordInputPlaceholder: 'Podaj hasło',
                      passwordInvalidError: 'Hasło powinno się składać z conajmniej 6 znaków.',
                      termsOfServiceConsentLabel: termsOfServiceConsentLabel,
                      termsOfServiceConsentSyntheticLabel: termsOfServiceConsentSyntheticLabel,
                      termsOfService: termsOfService,
                      termsOfServiceConsentNotGrantedError: 'Akceptacja Regulaminu jest wymagana.',
                      signUp: 'Zarejestruj',
                    },
                    en: {
                      headingOne: 'Sign Up',
                      businessNameInputLabel: 'Business Name',
                      businessNameInputPlaceholder: 'Provide business name',
                      businessNameInputInvalidError: 'Invalid business name.',
                      emailInputLabel: 'Email Address',
                      emailInputPlaceholder: 'Provide email address',
                      emailInvalidError: 'Invalid email address.',
                      passwordInputLabel: 'Password',
                      passwordInputPlaceholder: 'Provide password',
                      passwordInvalidError: 'The password has to consist at least six characters.',
                      phoneNumberExplanation: 'The phone number will appear at your listings as a contact data.',
                      phoneNumberInputLabel: 'Phone number',
                      phoneNumberInputPlaceholder: 'Provide phone number',
                      phoneNumberInputInvalidError: 'Invalid phone number.',
                      termsOfServiceConsentLabel: termsOfServiceConsentLabel,
                      termsOfServiceConsentSyntheticLabel: termsOfServiceConsentSyntheticLabel,
                      termsOfService: termsOfService,
                      termsOfServiceConsentNotGrantedError: 'The acceptance of the Terms of Service is required.',
                      signUp: 'Sign Up',
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
              end
            end
          end
        end
      end
    end
  end
end
