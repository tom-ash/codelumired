# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            module State
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::Texts

              private

              NO_ERROR = { pl: '', en: '' }.freeze
              EMPTY_TEXT_INPUT = ''

              def texts
                user_form_texts
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
