# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Create
          module Form
            class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
              include ::MapawynajmuPl::Api::Tracks::Listing::Create::Form::Meta

              private

              def label
                {
                  pl: 'Dodaj ogłoszenie za darmo',
                  en: 'Add Listing for free',
                }[lang]
              end
            end
          end
        end
      end
    end
  end
end
