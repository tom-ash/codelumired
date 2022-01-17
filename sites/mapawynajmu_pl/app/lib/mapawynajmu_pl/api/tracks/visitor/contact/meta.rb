# frozen_string_literal: true

module MapawynajmuPl
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
                pl: "kontakt, #{MAPAWYNAJMU_PL_APP_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                en: "contact, #{MAPAWYNAJMU_PL_APP_NAME}, announcement, lease, real estate, warsaw"
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: "Kontakt do #{MAPAWYNAJMU_PL_APP_NAME}, serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                en: "Contact to #{MAPAWYNAJMU_PL_APP_NAME}, a service featuring real estate lease announcements in Warsaw."
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
                'current/pl': ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Linker.new(:pl).call,
                'current/en': ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Linker.new(:en).call
              }
            end
          end
        end
      end
    end
  end
end
