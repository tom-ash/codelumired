# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Authorize
          module State
            EMPTY_TEXT = ''

            private

            def texts
              {
                pl: {
                  headingOne: 'Zaloguj',
                  emailInputLabel: 'Adres email',
                  emailInputPlaceholder: 'Podaj adres email',
                  emailInvalidError: 'Nieprawidłowy adres email.',
                  passwordInputLabel: 'Hasło',
                  passwordInputPlaceholder: 'Podaj hasło',
                  passwordInvalidError: 'Nieprawidłowe hasło.',
                  emailOrPasswordInvalidError: 'Nieprawidłowy email lub hasło.',
                  signIn: 'Zaloguj',
                  resetPassword: 'Zresetuj hasło',
                },
                en: {
                  headingOne: 'Sign In',
                  emailInputLabel: 'Email Address',
                  emailInputPlaceholder: 'Provide email address',
                  emailInvalidError: 'Invalid email address.',
                  passwordInputLabel: 'Password',
                  passwordInputPlaceholder: 'Provide password',
                  passwordInvalidError: 'Invalid password.',
                  emailOrPasswordInvalidError: 'Invalid email or password.',
                  signIn: 'Sign In',
                  resetPassword: 'Reset password',
                },
              }[lang]
            end

            def inputs
              {
                emailAddress: EMPTY_TEXT,
                password: EMPTY_TEXT,
                rememberMe: true,
              }
            end

            def errors
              {
                emailAddress: false,
                password: false,
                emailOrPassword: false,
              }
            end
          end
        end
      end
    end
  end
end
