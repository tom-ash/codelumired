# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module PrivacySettings
          class Linker < SkillfindTech::Api::Tracks::Common::Linker
            include ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Meta

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
