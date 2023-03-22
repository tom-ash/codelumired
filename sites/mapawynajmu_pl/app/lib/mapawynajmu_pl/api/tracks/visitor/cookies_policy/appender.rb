# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module CookiesPolicy
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Meta

            private

            def texts
              {
                pl: {
                  headingOne: 'Polityka Cookies',
                },
                en: {
                  headingOne: 'Cookies Policy',
                },
              }[lang]
            end
          end
        end
      end
    end
  end
end
