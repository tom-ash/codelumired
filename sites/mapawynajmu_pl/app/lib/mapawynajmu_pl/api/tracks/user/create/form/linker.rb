# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::Meta

              private

              def label
                {
                  pl: 'Zarejestruj',
                  en: 'Sign Up',
                }[lang]
              end
            end
          end
        end
      end
    end
  end
end
