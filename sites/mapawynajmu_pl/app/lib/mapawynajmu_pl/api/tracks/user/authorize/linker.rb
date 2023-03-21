# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Authorize
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            include ::MapawynajmuPl::Api::Tracks::User::Authorize::Meta

            private

            def label
              {
                pl: 'Zaloguj',
                en: 'Sign In',
              }[lang]
            end
          end
        end
      end
    end
  end
end
