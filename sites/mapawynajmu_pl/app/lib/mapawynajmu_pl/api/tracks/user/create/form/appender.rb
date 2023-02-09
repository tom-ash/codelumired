# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::Meta

              NO_ERROR = { pl: '', en: '' }.freeze
              EMPTY_TEXT_INPUT = ''

              private

              def inputs
                {
                  account_type: 'private',
                  businessName: EMPTY_TEXT_INPUT,
                  emailAddress: EMPTY_TEXT_INPUT,
                  password: EMPTY_TEXT_INPUT,
                  countryCode: '+48',
                  phoneNumber: EMPTY_TEXT_INPUT,
                  termsAndPrivacyConsent: false,
                }
              end

              def errors
                {
                  businessName: NO_ERROR,
                  emailAddress: NO_ERROR,
                  password: NO_ERROR,
                  phoneNumber: NO_ERROR,
                  termsAndPrivacyConsent: NO_ERROR,
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

# export const control = {
#   connecting: false,
#   verifying: false,
#   success: null,
#   step: 'form',
# }

# export const data = {
#   accountType: null,
#   businessName: null,
#   urlifiedBusinessName: null,
# }
