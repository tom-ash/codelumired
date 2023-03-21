# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module Contact
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            include ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Meta

            private

            def label
              {
                pl: 'Kontakt',
                en: 'Contact',
              }[lang]
            end
          end
        end
      end
    end
  end
end
