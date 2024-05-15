# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Users
          module Show
            class Linker < SkillfindTech::Api::Tracks::Common::Linker
              include ::SkillfindTech::Api::Tracks::User::Users::Show::Meta

              def call
                {
                  href: nil,
                  hrefLang: nil,
                  title: nil,
                  label: label,
                  icon: icon,
                }
              end

              private

              def label
                {
                  en: 'Account',
                  pl: 'Konto',
                }[lang]
              end

              def icon
                'circleUser'
              end
            end
          end
        end
      end
    end
  end
end
