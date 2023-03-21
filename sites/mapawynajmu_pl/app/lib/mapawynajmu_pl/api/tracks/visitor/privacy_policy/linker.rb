# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            include ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Meta

            private

            def label
              {
                pl: 'Polityka Prywatności',
                en: 'Privacy Policy',
              }[lang]
            end
          end
        end
      end
    end
  end
end
