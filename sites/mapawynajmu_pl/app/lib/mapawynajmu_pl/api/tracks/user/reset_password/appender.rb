# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module ResetPassword
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Meta

            NO_ERROR = { pl: '', en: '' }.freeze

            private

            def control
              {
                passwordStage: nil,
                passwordStep: nil,
                passwordConnecting: nil,
              }
            end

            def errors
              {
                password: NO_ERROR,
              }
            end
          end
        end
      end
    end
  end
end
