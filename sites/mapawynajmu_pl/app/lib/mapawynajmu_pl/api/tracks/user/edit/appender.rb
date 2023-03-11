# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Edit
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::User::Edit::Meta

            private

            def control
              {
                connecting: false,
                userDeleteCellOpened: false,
                # emailStep: 'currentEmailVerification',
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
                  userDeleteCellOpen: 'Usuń konto',
                  userDeleteTitle: 'Usuwanie konta',
                  userDeleteValue: 'Usunięcie konta jest nieodwracalne.',
                  userDeleteExplanation: "Kod weryfikacyjny został wysłany na adres email przypisany do konta. Wklej go ponizej i naciśnij przycisk 'Usuń konto', aby nieodwracalnie usunąć konto.",
                  deleteUser: 'Usuń konto',
                },
                en: {
                  cellOpen: 'Change',
                  cellClose: 'Cancel',
                  headingOne: 'Account Settings',
                  verificationCodeInputLabel: 'Verification Code',
                  verificationCodeInputInvalidError: 'Invalid verification code.',
                  userDeleteCellOpen: 'Delete account',
                  userDeleteTitle: 'Account Deletion',
                  userDeleteValue: 'Account deletion is irreversible.',
                  userDeleteExplanation: "The verification code has been sent to the account email address. Paste it below and click 'Delete account' to irreversibly delete the account.",
                  deleteUser: 'Delete Account',
                },
              }[lang]
            end

            def data
              ::Serializers::User::Edit.new(
                user: authenticated_user,
                constantized_site_name: constantized_site_name,
              ).call
            end

            def inputs
              {
                country_code: authenticated_user.country_code,
              }
            end
          end
        end
      end
    end
  end
end
