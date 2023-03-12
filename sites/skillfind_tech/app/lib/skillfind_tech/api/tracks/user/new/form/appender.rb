# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Form
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::SkillfindTech::Api::Tracks::User::New::Form::State
              include ::SkillfindTech::Api::Tracks::User::New::Form::Meta
            end
          end
        end
      end
    end
  end
end
