# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            include ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Meta

            private

            def label
              {
                pl: 'Regulamin',
                en: 'Terms of Service',
              }[lang]
            end
          end
        end
      end
    end
  end
end
