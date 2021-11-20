# frozen_string_literal: true

module Codelumi
  module Api
    module Visitor
      module Tracks
        module CookiesPolicy
          module Meta
            UNLOCALIZED_TITLE = {
              pl: 'Polityka Cookies',
              en: 'Cookies Policy'
            }.freeze

            private

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'polityka cookies, soundof.IT',
                en: 'cookies policy, soundof.IT'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Polityka Cookies soundof.IT.',
                en: 'Cookies Policy of soundof.IT.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
