# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Tracks
        module Root
          module Meta
            private

            def unlocalized_title
              @unlocalized_title ||= {
                pl: 'Ogłoszenia wynajmu nieruchomości w Warszawie | Mapa',
                en: 'Real Estate Lease Announcements in Warsaw | Map'
              }.freeze
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'ogłoszenia, oferty, wynajem, najem, nieruchomości, warszawa, mapa, bezpłatne, bezpłatnie, darmowe, za darmo, mieszkania, domy, pokoje, miejsca postojowe, lokale użytkowe, biura, biura wirtualne, coworking',
                en: 'announcements, offers, lease, rent, real estate, warsaw, map, free, apartments, flats, houses, rooms, parking spaces, usable premises, offices, virtual offices, coworking'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Ogłoszenia nieruchomości na wynajem w Warszawie na mapie. Za darmo dodaj ogłoszenie wynajmu między innymi mieszkania, pokoju, biura lub lokalu użytkowego.',
                en: 'Warsaw real estate lease announcements on a map. Add a free lease announcement of among others an apartment, a room, an office and/or usable premises.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
