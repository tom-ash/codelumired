# frozen_string_literal: true

module Warsawlease
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
                pl: 'polityka cookies, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'cookies policy, warsawlease.pl, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Polityka Cookies warsawlease.pl, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Cookies Policy of warsawlease.pl, a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
