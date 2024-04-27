# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
            include ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Meta

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

            def asset_names
              @asset_names ||= header_asset_names
            end
          end
        end
      end
    end
  end
end
