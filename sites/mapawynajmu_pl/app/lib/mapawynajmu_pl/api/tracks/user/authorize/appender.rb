# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Authorize
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::User::Authorize::Meta

            NO_ERROR = { pl: '', en: '' }.freeze
            EMPTY_TEXT_INPUT = ''

            private

            def errors
              {
                email: NO_ERROR,
                emailOrPassword: NO_ERROR,
              }
            end
          end
        end
      end
    end
  end
end
