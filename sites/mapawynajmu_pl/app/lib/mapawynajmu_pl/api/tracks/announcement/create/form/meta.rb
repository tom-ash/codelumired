# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            module Meta
              TRACK = 'announcement/create/form'

              UNLOCALIZED_PATH = {
                pl: 'dodaj-ogloszenie-wynajmu-nieruchomosci-w-warszawie',
                en: 'add-announcement-of-real-estate-lease-in-warsaw'
              }.freeze

              UNLOCALIZED_TITLE = {
                pl: 'Dodaj bezpłatne ogłoszenie wynajmu nieruchomości w Warszawie',
                en: 'Add Free Real Estate Lease Announcement in Warsaw'
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
                  pl: 'dodaj, bezpłatne, bezpłatnie, darmowe, za darmo, ogłoszenie, oferta, oferte, wynajem, wynajmu, najem, najmu, nieruchomości, warszawa, mieszkania, mieszkanie, domy, dom, pokoje, pokój, miejsca parkingowe, miejsce parkingowe, lokale użytkowe, lokal użytkowy, biura, biuro, biura wirtualne, biuro wirtualne, coworking',
                  en: 'add, free, announcement, offer, lease, rent, real estate, warsaw, apartments, flats, apartment, flat, houses, house, rooms, room, parking spaces, parking space, usable premises, offices, office, virtual offices, virtual office, coworking'
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  pl: 'Dodaj bezpłatne ogłoszenie wynajmu nieruchomości w Warszawie. Ogłoś o najmie mieszkania, pokoju, lokalu użytkowego, biura lub innej nieruchomości w Warszawie.',
                  en: 'Add a free real estate lease announcement in Warsaw. Annouce lease of an apartment, a room, usable premises, an offices and/or other real estate in Warsaw.'
                }.freeze
              end

              def render
                {
                  'visitor': true,
                  'announcement': true,
                  'announcement/create': true,
                  'announcement/create/form': true,
                  'page': true,
                  'page/show': true
                }
              end

              def links
                {
                  'current/pl': ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Linker.new(:pl).call,
                  'current/en': ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Linker.new(:en).call
                }
              end

              def asset_names
                @asset_names ||= %i[camera close chevron rotate]
              end
            end
          end
        end
      end
    end
  end
end
