# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Edit
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::User::Edit::Meta
            include ::MapawynajmuPl::Api::Tracks::User::Common::CountryCodes

            private

            def authorize!
              raise ::Api::UnauthorizedError unless authenticated_user.present?
            end

            def control
              {
                connecting: false,
                businessNameCellOpened: false,
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
                  businessNameCellTitle: 'Nazwa firmy',
                  businessNameInputExplanation: 'Podaj nową nazwę firmy i naciśnij przycisk "Zmień".',
                  businessNameInputLabel: 'Nazwa firmy',
                  businessNameInputPlaceholder: 'Podaj nową nazwę firmy',
                  businessNameInputInvalidError: 'Nazwa firmy nie może być pusta.',
                  businessNameSubmitButtonLabel: 'Zmień',
                  countryCodeAndPhoneNumberCellTitle: 'Numer telefonu',
                  countryCodeAndPhoneNumberInputsExplanation: 'Podaj nowy numer telefonu i naciśnij przycisk "Zmień".',
                  countryCodeAndPhoneNumberSubmitButtonLabel: 'Zmień',
                  phoneNumberInputLabel: 'Numer telefonu',
                  phoneNumberInputPlaceholder: 'Podaj numer telefonu',
                  phoneNumberInputInvalidError: 'Nieprawidłowy numer telefonu.',
                  userDeleteCellOpen: 'Usuń konto',
                  userDeleteCellTitle: 'Usuwanie konta',
                  userDeleteInputExplanation: "Kod weryfikacyjny został wysłany na adres email przypisany do konta. Wklej go ponizej i naciśnij przycisk 'Usuń konto', aby nieodwracalnie usunąć konto.",
                  userDeleteSubmitButtonLabel: 'Usuń konto',
                  verificationCodeInputLabel: 'Kod werifykacyjny',
                  verificationCodeInputInvalidError: 'Nieprawidłowy kod weryfikacyjny.',
                },
                en: {
                  cellOpen: 'Change',
                  cellClose: 'Cancel',
                  headingOne: 'Account Settings',
                  businessNameCellTitle: 'Business Name',
                  businessNameInputExplanation: 'Provide new business name and click the "Change" button.',
                  businessNameInputLabel: 'Business Name',
                  businessNameInputPlaceholder: 'Provide new business name',
                  businessNameInputInvalidError: 'The business name cannot be blank.',
                  businessNameSubmitButtonLabel: 'Change',
                  countryCodeAndPhoneNumberCellTitle: 'Phone number',
                  countryCodeAndPhoneNumberInputsExplanation: 'Provide new phone number and click the "Change" button.',
                  countryCodeAndPhoneNumberSubmitButtonLabel: 'Change',
                  phoneNumberInputLabel: 'Phone number',
                  phoneNumberInputPlaceholder: 'Provide phone number',
                  phoneNumberInputInvalidError: 'Invalid phone number.',
                  userDeleteCellOpen: 'Delete account',
                  userDeleteCellTitle: 'Account Deletion',
                  userDeleteInputExplanation: "The verification code has been sent to the account email address. Paste it below and click 'Delete account' to irreversibly delete the account.",
                  userDeleteSubmitButtonLabel: 'Delete Account',
                  verificationCodeInputLabel: 'Verification Code',
                  verificationCodeInputInvalidError: 'Invalid verification code.',
                },
              }[lang]
            end

            def data
              {
                pl: {
                  userDeleteCellValue: 'Usunięcie konta jest nieodwracalne.',
                },
                en: {
                  userDeleteCellValue: 'Account deletion is irreversible.',
                },
              }[lang].merge(
                businessNameCellValue: authenticated_user.business_name,
                countryCodeAndPhoneNumberCellValue: "#{authenticated_user.country_code} #{authenticated_user.phone_number}",
                email: authenticated_user.email,
              )
            end

            def inputs
              {
                businessName: authenticated_user.business_name,
                countryCode: authenticated_user.country_code,
                countryCodes: countryCodes,
                phoneNumber: authenticated_user.phone_number,
              }
            end
          end
        end
      end
    end
  end
end
