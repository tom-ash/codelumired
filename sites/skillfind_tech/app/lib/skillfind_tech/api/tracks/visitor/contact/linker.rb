# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module Contact
          class Linker < SkillfindTech::Api::Tracks::Common::Linker
            include ::SkillfindTech::Api::Tracks::Visitor::Contact::Meta

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
