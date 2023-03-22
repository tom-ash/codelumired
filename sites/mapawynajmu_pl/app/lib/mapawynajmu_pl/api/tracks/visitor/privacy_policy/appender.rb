# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Meta

            private

            def texts
              {
                pl: {
                  headingOne: 'Polityka Prywatności',
                },
                en: {
                  headingOne: 'Privacy Policy',
                },
              }[lang]
            end
          end
        end
      end
    end
  end
end
