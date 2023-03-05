# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            module State
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::State::Texts
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::State::Inputs
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::State::Errors

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
