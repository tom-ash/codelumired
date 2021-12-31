# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module ResetPassword
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Meta
          end
        end
      end
    end
  end
end
