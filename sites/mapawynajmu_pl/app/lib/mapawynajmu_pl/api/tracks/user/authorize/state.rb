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
                  emailInputInvalidError: 'Nieprawidłowy adres email.',
                  passwordInputLabel: 'Hasło',
                  passwordInputPlaceholder: 'Podaj hasło',
                  passwordInputInvalidError: 'Nieprawidłowe hasło.',
                  credentialsInvalidError: 'Nieprawidłowy email lub hasło.',
                  signIn: 'Zaloguj',
                  resetPassword: 'Zresetuj hasło',
                },
                en: {
                  headingOne: 'Sign In',
                  emailInputLabel: 'Email Address',
                  emailInputPlaceholder: 'Provide email address',
                  emailInputInvalidError: 'Invalid email address.',
                  passwordInputLabel: 'Password',
                  passwordInputPlaceholder: 'Provide password',
                  passwordInputInvalidError: 'Invalid password.',
                  credentialsInvalidError: 'Invalid email or password.',
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
                credentials: false,
              }
            end
          end
        end
      end
    end
  end
end
