# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::State
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::Meta
            end
          end
        end
      end
    end
  end
end
