# frozen_string_literal: true

module Codelumi
  module Api
    module Visitor
      module Tracks
        module Contact
          module Meta
            UNLOCALIZED_TITLE = {
              pl: 'Kontakt',
              en: 'Contact'
            }.freeze

            private

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'kontakt, soundof.IT',
                en: 'contact, soundof.IT'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Kontakt do soundof.IT.',
                en: 'Contact to soundof.IT.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
