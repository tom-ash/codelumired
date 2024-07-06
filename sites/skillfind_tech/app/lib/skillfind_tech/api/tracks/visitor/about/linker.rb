# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module About
          class Linker < SkillfindTech::Api::Tracks::Common::Linker
            include ::SkillfindTech::Api::Tracks::Visitor::About::Meta

            private

            def label
              {
                pl: 'O skillfind.tech',
                en: 'About skillfind.tech',
              }[lang]
            end
          end
        end
      end
    end
  end
end
