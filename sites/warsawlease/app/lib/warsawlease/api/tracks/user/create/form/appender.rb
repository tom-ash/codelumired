# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module User
        module Create
          module Form
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::Warsawlease::Api::Tracks::User::Create::Form::Meta
            end
          end
        end
      end
    end
  end
end
