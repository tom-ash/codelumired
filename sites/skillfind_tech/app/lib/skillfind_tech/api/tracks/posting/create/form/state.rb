# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Create
          module Form
            module State
              include ::SkillfindTech::Api::Tracks::User::New::Form::State::Texts
              include ::SkillfindTech::Api::Tracks::User::New::Form::State::Inputs
              include ::SkillfindTech::Api::Tracks::User::New::Form::State::Errors

              private
            end
          end
        end
      end
    end
  end
end
