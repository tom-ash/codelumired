# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
              include ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Meta

              private

              def label
                {
                  pl: 'Dodaj ogłoszenie',
                  en: 'Add Listing',
                }[lang]
              end
            end
          end
        end
      end
    end
  end
end
