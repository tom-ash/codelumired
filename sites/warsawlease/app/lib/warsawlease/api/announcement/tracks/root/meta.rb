# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Tracks
        module Root
          module Meta
            def unlocalized_title
              @unlocalized_title ||= {
                pl: 'Mapa nieruchomości na wynajem w Warszawie - Mieszkania, biura i lokale użytkowe',
                en: 'Map of Real Estates for Lease in Warsaw - Apartments, Offices and Usable premises'
              }.freeze
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'mapa, warszawa, nieruchomość, nieruchomości, wynajem, najem, wynajęcie, mieszkania, lokale użytkowe, biura, mieszkanie, lokal użytkowy, biuro, ogłoszenia, ogłoszenie',
                en: 'map, warsaw, real estate, real estates, lease, apartments, usable premises, offices, apartment, office, announcements, announcement'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Bezpłatne ogłoszenia nieruchomości na wynajem w Warszawie na mapie. Przeglądaj i dodawaj darmowe ogłoszenia wynajmu w kategorii: mieszkanie, biuro, lokal użytkowy.',
                en: 'Free announcements of real estate lease in Warsaw on the map. Search and add free announcements of lease in the categories: apartment, office, usable premises.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
