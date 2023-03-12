# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Form
            module State
              module Texts
                private

                def user_form_texts
                  {
                    pl: {
                      headingOne: 'Zarejestruj',
                      emailInputLabel: 'Adres email',
                      emailInputPlaceholder: 'Podaj adres email',
                      emailInputInvalidError: 'Nieprawidłowy adres email.',
                      passwordInputLabel: 'Hasło',
                      passwordInputPlaceholder: 'Podaj hasło',
                      passwordInputInvalidError: 'Hasło powinno się składać z conajmniej 6 znaków.',
                      termsOfServiceConsentLabel: termsOfServiceConsentLabel,
                      termsOfServiceConsentSyntheticLabel: termsOfServiceConsentSyntheticLabel,
                      termsOfService: termsOfService,
                      termsOfServiceConsentNotGrantedError: 'Akceptacja Regulaminu jest wymagana.',
                      signUp: 'Zarejestruj',
                    },
                    en: {
                      headingOne: 'Sign Up',
                      emailInputLabel: 'Email Address',
                      emailInputPlaceholder: 'Provide email address',
                      emailInputInvalidError: 'Invalid email address.',
                      passwordInputLabel: 'Password',
                      passwordInputPlaceholder: 'Provide password',
                      passwordInputInvalidError: 'The password has to consist at least six characters.',
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
