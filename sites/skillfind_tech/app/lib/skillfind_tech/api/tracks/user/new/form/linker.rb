# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Form
            class Linker < ::SkillfindTech::Api::Tracks::Common::Linker
              include ::SkillfindTech::Api::Tracks::User::New::Form::Meta

              private

              def label
                {
                  pl: 'Zarejestruj',
                  en: 'Sign Up',
                }[lang]
              end

              def icon
                'userPlus'
              end
            end
          end
        end
      end
    end
  end
end
