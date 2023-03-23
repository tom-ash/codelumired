# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Meta

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
