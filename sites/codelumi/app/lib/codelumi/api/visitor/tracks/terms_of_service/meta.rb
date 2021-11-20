# frozen_string_literal: true

module Codelumi
  module Api
    module Visitor
      module Tracks
        module TermsOfService
          module Meta
            UNLOCALIZED_TITLE = {
              pl: 'Regulamin',
              en: 'Terms of Service'
            }.freeze

            private

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'regulamin, soundof.IT',
                en: 'terms of service'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Regulamin soundof.IT.',
                en: 'Terms of Service of soundof.IT.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
