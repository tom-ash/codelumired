# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module CookiesPolicy
          class Linker < SkillfindTech::Api::Tracks::Common::Linker
            include ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Meta

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
