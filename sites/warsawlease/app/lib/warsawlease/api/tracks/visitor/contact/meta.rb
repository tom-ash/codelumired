# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Visitor
        module Contact
          module Meta
            TRACK = 'visitor/contact'

            UNLOCALIZED_PATH = {
              pl: 'kontakt',
              en: 'contact'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Kontakt',
              en: 'Contact'
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
                pl: 'kontakt, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                en: 'contact, warsawlease.pl, announcement, lease, real estate, warsaw'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Kontakt do warsawlease.pl, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                en: 'Contact to warsawlease.pl, a service featuring real estate lease announcements in Warsaw.'
              }.freeze
            end

            def render
              {
                visitor: true,
                'visitor/contact': true
              }
            end

            def links
              {
                'current/pl': ::Warsawlease::Api::Tracks::Visitor::Contact::Linker.new(:pl).call,
                'current/en': ::Warsawlease::Api::Tracks::Visitor::Contact::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
