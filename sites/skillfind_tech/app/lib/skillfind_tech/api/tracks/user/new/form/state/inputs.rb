# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Form
            module State
              module Inputs
                private

                EMPTY_TEXT = ''

                def user_form_inputs
                  {
                    emailAddress: EMPTY_TEXT,
                    password: EMPTY_TEXT,
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
