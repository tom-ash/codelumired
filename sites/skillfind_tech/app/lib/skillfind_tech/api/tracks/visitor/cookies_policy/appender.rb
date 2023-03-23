# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module CookiesPolicy
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Meta

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
