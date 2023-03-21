# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module CookiesPolicy
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            include ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Meta

            private

            def label
              {
                pl: 'Polityka Cookies',
                en: 'Cookies Policy',
              }[lang]
            end
          end
        end
      end
    end
  end
end
