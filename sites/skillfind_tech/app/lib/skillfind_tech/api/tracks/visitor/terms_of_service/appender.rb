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

            def asset_names
              @asset_names ||= header_asset_names
            end
          end
        end
      end
    end
  end
end
