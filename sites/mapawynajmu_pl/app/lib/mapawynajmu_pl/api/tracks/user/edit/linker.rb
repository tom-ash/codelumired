# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Edit
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            include ::MapawynajmuPl::Api::Tracks::User::Edit::Meta

            private

            def label
              {
                pl: 'Ustawienia konta',
                en: 'Account settings'
              }[lang]
            end
          end
        end
      end
    end
  end
end
