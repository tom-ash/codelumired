# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          module Meta
            TRACK = 'visitor/privacy-policy'

            UNLOCALIZED_PATH = {
              pl: 'polityka-prywatnosci',
              en: 'privacy-policy'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Polityka Prywatności',
              en: 'Privacy Policy'
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
                pl: 'polityka prywatności, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'privacy policy, warsawlease.pl, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Polityka prywatności warsawlease.pl, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Privacy Policy of warsawlease.pl, a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end

            def render
              {
                visitor: true,
                'visitor/privacy-policy': true
              }
            end

            def links
              {
                'current/pl': ::Warsawlease::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(:pl).call,
                'current/en': ::Warsawlease::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
