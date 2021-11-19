# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Tracks
        module Create
          module Meta
            private

            def unlocalized_title
              @unlocalized_title ||= {
                pl: 'Dodaj bezpłatne ogłoszenie wynajmu nieruchomości w Warszawie',
                en: 'Add Free Real Estate Lease Announcement in Warsaw'
              }.freeze
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: 'dodaj, bezpłatne, bezpłatnie, darmowe, za darmo, ogłoszenie, oferta, oferte, wynajem, wynajmu, najem, najmu, nieruchomości, warszawa, mieszkania, mieszkanie, domy, dom, pokoje, pokój, miejsca postojowe, miejsce postojowe, lokale użytkowe, lokal użytkowy, biura, biuro, biura wirtualne, biuro wirtualne, coworking',
                en: 'add, free, announcement, offer, lease, rent, real estate, warsaw, apartments, flats, apartment, flat, houses, house, rooms, room, parking spaces, parking space, usable premises, offices, office, virtual offices, virtual office, coworking'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: 'Dodaj bezpłatne ogłoszenie wynajmu nieruchomości w Warszawie. Ogłoś o najmie mieszkania, pokoju, lokalu użytkowego, biura lub innej nieruchomości w Warszawie.',
                en: 'Add a free real estate lease announcement in Warsaw. Annouce lease of an apartment, a room, usable premises, an offices and/or other real estate in Warsaw.'
              }.freeze
            end
          end
        end
      end
    end
  end
end
