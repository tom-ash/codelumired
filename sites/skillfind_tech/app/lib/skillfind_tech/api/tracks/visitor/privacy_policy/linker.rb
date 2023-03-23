# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          class Linker < SkillfindTech::Api::Tracks::Common::Linker
            include ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Meta

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
