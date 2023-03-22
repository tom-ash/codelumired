# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Meta

            private

            def texts
              {
                pl: {
                  headingOne: 'Regulamin',
                },
                en: {
                  headingOne: 'Terms of Service',
                },
              }[lang]
            end
          end
        end
      end
    end
  end
end
