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
                pl: 'polityka cookies, soundof.IT, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'cookies policy, soundof.IT, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Polityka Cookies soundof.IT, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Cookies Policy of soundof.IT, a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
