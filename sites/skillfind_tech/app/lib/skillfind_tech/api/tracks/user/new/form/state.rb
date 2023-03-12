# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Form
            module State
              include ::SkillfindTech::Api::Tracks::User::New::Form::State::Texts
              include ::SkillfindTech::Api::Tracks::User::New::Form::State::Inputs
              include ::SkillfindTech::Api::Tracks::User::New::Form::State::Errors

              private

              def texts
                user_form_texts
              end

              def inputs
                user_form_inputs
              end

              def errors
                user_form_errors
              end
            end
          end
        end
      end
    end
  end
end
