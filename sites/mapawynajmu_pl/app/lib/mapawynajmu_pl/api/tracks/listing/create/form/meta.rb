# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Create
          module Form
            module Meta
              TRACK = 'announcement/create/form'

              UNLOCALIZED_PATH = {
                pl: 'dodaj-ogloszenie-wynajmu-nieruchomosci',
                en: 'add-real-estate-lease-listing',
              }.freeze

              UNLOCALIZED_TITLE = {
                pl: 'Dodaj ogłoszenie wynajmu nieruchomości',
                en: 'Add Real Estate Lease Listing',
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
                  pl: 'dodaj, bezpłatne, bezpłatnie, darmowe, za darmo, ogłoszenie, oferta, oferte, wynajem, wynajmu, najem, najmu, nieruchomości, mieszkania, mieszkanie, domy, dom, pokoje, pokój, miejsca parkingowe, miejsce parkingowe, lokale użytkowe, lokal użytkowy, biura, biuro, biura wirtualne, biuro wirtualne, coworking',
                  en: 'add, free, announcement, offer, lease, rent, property, real estate, apartments, flats, apartment, flat, houses, house, rooms, room, parking spaces, parking space, usable premises, offices, office, virtual offices, virtual office, coworking',
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  pl: 'Dodaj ogłoszenie wynajmu nieruchomości. Ogłoś o najmie mieszkania, pokoju, lokalu użytkowego, biura lub innej nieruchomości.',
                  en: 'Add a real estate lease listing. Annouce a rent of an apartment, a room, usable premises, an offices and/or other real estate.',
                }.freeze
              end

              def render
                {
                  'visitor': true,
                  'announcement': true,
                  'announcement/create': true,
                  'announcement/create/form': true,
                }
              end

              def links
                {
                  'current/pl': ::MapawynajmuPl::Api::Tracks::Listing::Create::Form::Linker.new(:pl).call,
                  'current/en': ::MapawynajmuPl::Api::Tracks::Listing::Create::Form::Linker.new(:en).call,
                }
              end

              def asset_names
                @asset_names ||= %i[
                  plus
                  rocket
                  info
                  caretDown
                  camera
                  close
                  chevron
                  rotate
                  apartment
                  house
                  room
                  parkingSpace
                  usablePremises
                  office
                  virtualOffice
                  coworkingSpace
                  advertisingSpaces
                  garage
                  facebook_square
                  linkedin_square
                  twitter_square
                  star
                  people
                ]
              end
            end
          end
        end
      end
    end
  end
end
