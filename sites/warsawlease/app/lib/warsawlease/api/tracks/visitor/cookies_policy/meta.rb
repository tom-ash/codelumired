# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Visitor
        module CookiesPolicy
          module Meta
            TRACK = 'visitor/cookies-policy'

            UNLOCALIZED_PATH = {
              pl: 'polityka-cookies',
              en: 'cookies-policy'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Polityka Cookies',
              en: 'Cookies Policy'
            }.freeze

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end

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

            def render
              {
                visitor: true,
                'visitor/cookies-policy': true
              }
            end

            def links
              {
                'current/pl': ::Warsawlease::Api::Tracks::Visitor::CookiesPolicy::Linker.new(:pl).call,
                'current/en': ::Warsawlease::Api::Tracks::Visitor::CookiesPolicy::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
