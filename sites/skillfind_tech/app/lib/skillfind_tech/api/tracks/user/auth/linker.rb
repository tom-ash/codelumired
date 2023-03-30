# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Auth
          class Linker < SkillfindTech::Api::Tracks::Common::Linker
            include ::SkillfindTech::Api::Tracks::User::Auth::Meta

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
