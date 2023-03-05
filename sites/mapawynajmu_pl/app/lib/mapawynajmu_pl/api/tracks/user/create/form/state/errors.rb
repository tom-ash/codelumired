# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            module State
              module Errors
                private

                def user_form_errors
                  {
                    businessName: false,
                    emailAddress: false,
                    password: false,
                    phoneNumber: false,
                    termsOfServiceConsent: false,
                  }
                end
              end
            end
          end
        end
      end
    end
  end
end
