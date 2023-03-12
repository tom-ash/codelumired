# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Form
            module State
              module Errors
                private

                def user_form_errors
                  {
                    emailAddress: false,
                    password: false,
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
