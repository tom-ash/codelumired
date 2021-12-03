# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          module Meta
            TRACK = 'visitor/terms-of-service'

            UNLOCALIZED_PATH = {
              pl: 'regulamin',
              en: 'terms-of-service'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Regulamin',
              en: 'Terms of Service'
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
                pl: 'regulamin, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'terms of service, warsawlease.pl, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Regulamin warsawlease.pl, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Terms of Service of warsawlease.pl, a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end

            def render
              {
                visitor: true,
                'visitor/terms-of-service': true
              }
            end

            def links
              {
                'current/pl': ::Warsawlease::Api::Tracks::Visitor::TermsOfService::Linker.new(:pl).call,
                'current/en': ::Warsawlease::Api::Tracks::Visitor::TermsOfService::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
