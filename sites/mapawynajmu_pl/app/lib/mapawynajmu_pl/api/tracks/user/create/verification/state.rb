# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Verification
            module State
              EMPTY_TEXT = ''

              private

              def texts
                {
                  pl: {
                    headingOne: 'Potwierdź adres email',
                    verificationCodeExplanation: 'Kod weryfikacyjny został wysłany na podany adres email. Wklej go poniżej i potwierdź, aby zakończyć proces rejestracji.',
                    verificationCodeInputLabel: 'Kod werifykacyjny',
                    verificationCodeInputInvalidError: 'Nieprawidłowy kod weryfikacyjny.',
                    verify: 'Potwierdź',
                  },
                  en: {
                    headingOne: 'Confirm Email Address',
                    verificationCodeExplanation: 'The verification code has been sent to the provided email address. Paste it below and confirm to finalize the registration.',
                    verificationCodeInputLabel: 'Verification Code',
                    verificationCodeInputInvalidError: 'Invalid verification code.',
                    verify: 'Confirm',
                  },
                }[lang]
              end

              def inputs
                {
                  verificationCode: EMPTY_TEXT,
                }
              end

              def errors
                {
                  verificationCode: false,
                }
              end
            end
          end
        end
      end
    end
  end
end
