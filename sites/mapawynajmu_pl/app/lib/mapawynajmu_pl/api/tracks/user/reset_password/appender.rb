# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module ResetPassword
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Meta

            NO_ERROR = { pl: '', en: '' }.freeze

            private

            # import React from 'react'

            # export const emailAddress = {
            #   pl: <span>Podaj adres email przypisany do Twojego konta.</span>,
            #   en: <span>Provide the email address associated with your account.</span>,
            # }

            # export const verificationCode = {
            #   pl: <span>Kod weryfikacyjny został wysłany na podany adres email. Wklej go poniżej i naciśnij 'Dalej'.</span>,
            #   en: <span>The verification code was sent to the provided email address. Paste it below and press 'Next'.</span>,
            # }

            # export const password = {
            #   pl: <span>Podaj nowe hasło.</span>,
            #   en: <span>Provide new password.</span>,
            # }

            # export const success = {
            #   pl: <span>Twoje hasło zostało zmienione.</span>,
            #   en: <span>Your password was changed.</span>,
            # }


            def texts
              {
                pl: {
                  headingOne: 'Zresetuj hasło',
                  emailInputLabel: 'Adres email',
                  emailInputPlaceholder: 'Podaj adres email',
                  emailInvalidError: 'Nieprawidłowy adres email.',
                  submitEmail: 'Dalej',
                  verificationCodeInputLabel: 'Kod werifykacyjny',
                  verificationCodeInputInvalidError: 'Nieprawidłowy kod weryfikacyjny.',
                  passwordInputLabel: 'Hasło',
                  passwordInputPlaceholder: 'Podaj hasło',
                  passwordInvalidError: 'Hasło powinno się składać z conajmniej 6 znaków.',
                },
                en: {
                  headingOne: 'Reset password',
                  emailInputLabel: 'Email Address',
                  emailInputPlaceholder: 'Provide email address',
                  emailInvalidError: 'Invalid email address.',
                  submitEmail: 'Next',
                  verificationCodeInputLabel: 'Verification Code',
                  verificationCodeInputInvalidError: 'Invalid verification code.',
                  passwordInputLabel: 'Password',
                  passwordInputPlaceholder: 'Provide password',
                  passwordInvalidError: 'The password has to consist at least six characters.',
                },
              }[lang]
            end

            def control
              {
                step: 'email',
                connecting: false,
              }
            end

            def errors
              {
                emailAddress: false,
                verificationCode: false,
                password: false,
              }
            end
          end
        end
      end
    end
  end
end
