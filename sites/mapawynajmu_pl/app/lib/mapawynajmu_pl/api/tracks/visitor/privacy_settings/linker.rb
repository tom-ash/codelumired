# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module PrivacySettings
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            include ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Meta

            private

            def label
              {
                pl: 'Ustawienia prywatności',
                en: 'Privacy Settings',
              }[lang]
            end
          end
        end
      end
    end
  end
end
