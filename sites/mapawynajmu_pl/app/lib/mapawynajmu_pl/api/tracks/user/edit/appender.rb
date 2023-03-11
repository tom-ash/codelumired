# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Edit
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::User::Edit::Meta
            include ::MapawynajmuPl::Api::Tracks::User::Common::CountryCodes

            private

            def control
              {
                connecting: false,
                countryCodeAndPhoneNumberCellOpened: false,
                userDeleteCellOpened: false,
              }
            end

            def texts
              {
                pl: {
                  cellOpen: 'Zmień',
                  cellClose: 'Anuluj',
                  headingOne: 'Ustawienia konta',
                  verificationCodeInputLabel: 'Kod werifykacyjny',
                  verificationCodeInputInvalidError: 'Nieprawidłowy kod weryfikacyjny.',
                  countryCodeAndPhoneNumberTitle: 'Numer telefonu',
                  countryCodeAndPhoneNumberExplanation: 'Podaj nowy numer telefonu i naciśnij przycisk "Zmień".',
                  countryCodeAndPhoneNumberSubmitButtonLabel: 'Zmień',
                  phoneNumberInputLabel: 'Numer telefonu',
                  phoneNumberInputPlaceholder: 'Podaj numer telefonu',
                  phoneNumberInvalidError: 'Nieprawidłowy numer telefonu.',
                  userDeleteCellOpen: 'Usuń konto',
                  userDeleteTitle: 'Usuwanie konta',
                  userDeleteExplanation: "Kod weryfikacyjny został wysłany na adres email przypisany do konta. Wklej go ponizej i naciśnij przycisk 'Usuń konto', aby nieodwracalnie usunąć konto.",
                  userDeleteButtonLabel: 'Usuń konto',
                },
                en: {
                  cellOpen: 'Change',
                  cellClose: 'Cancel',
                  headingOne: 'Account Settings',
                  verificationCodeInputLabel: 'Verification Code',
                  verificationCodeInputInvalidError: 'Invalid verification code.',
                  countryCodeAndPhoneNumberTitle: 'Phone number',
                  countryCodeAndPhoneNumberExplanation: 'Provide new phone number and click the "Change" button.',
                  countryCodeAndPhoneNumberSubmitButtonLabel: 'Change',
                  phoneNumberInputLabel: 'Phone number',
                  phoneNumberInputPlaceholder: 'Provide phone number',
                  phoneNumberInvalidError: 'Invalid phone number.',
                  userDeleteCellOpen: 'Delete account',
                  userDeleteTitle: 'Account Deletion',
                  userDeleteExplanation: "The verification code has been sent to the account email address. Paste it below and click 'Delete account' to irreversibly delete the account.",
                  userDeleteButtonLabel: 'Delete Account',
                },
              }[lang]
            end

            def data
              {
                pl: {
                  userDeleteValue: 'Usunięcie konta jest nieodwracalne.',
                },
                en: {
                  userDeleteValue: 'Account deletion is irreversible.',
                },
              }[lang].merge(
                countryCodeAndPhoneNumberValue: "#{authenticated_user.country_code} #{authenticated_user.phone_number}",
                email: authenticated_user.email,
              )
            end

            def inputs
              {
                country_code: authenticated_user.country_code,
                phoneNumber: authenticated_user.phone_number,
                countryCodes: countryCodes,
              }
            end
          end
        end
      end
    end
  end
end
