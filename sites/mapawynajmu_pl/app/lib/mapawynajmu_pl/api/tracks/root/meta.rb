# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        module Meta
          include ::MapawynajmuPl::Api::Tracks::Listing::Common::PartnerAndCategory

          TRACK = 'root'

          ROOT_PL = '/'
          CATEGORY_PL = "wynajem/(?<current_category_name>#{::MapawynajmuPl::Listing::URL_CATEGORIES})"
          PARTNER_PL = "partnerzy\/(?<current_partner_name>[^\/]+)"

          ROOT_EN = 'en'
          CATEGORY_EN = "rent/(?<current_category_name>#{::MapawynajmuPl::Listing::URL_CATEGORIES})"
          PARTNER_EN = "partners\/(?<current_partner_name>[^\/]+)"

          UNLOCALIZED_PATH = {
            pl: %r{^#{ROOT_PL}$|^(#{PARTNER_PL})?(\/)?(#{CATEGORY_PL})?$},
            en: %r{^#{ROOT_EN}$|^(#{PARTNER_EN})?(\/)?(#{CATEGORY_EN})?$},
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: 'Mapa wynajmu nieruchomości w Polsce',
            en: 'Map of real estate for rent in Poland',
          }.freeze

          private

          def track
            @track ||= TRACK
          end

          def title
            @title ||= begin
              return current_category_title if category_from_path.present?

              unlocalized_title[lang]
            end
          end

          def venue
            @venue ||= :map
          end

          def unlocalized_path
            @unlocalized_path ||= UNLOCALIZED_PATH
          end

          def unlocalized_title
            @unlocalized_title ||= UNLOCALIZED_TITLE
          end

          def unlocalized_keywords
            @unlocalized_keywords ||= {
              pl: 'mapa, wynajem, nieruchomości, mieszkania, bezpłatne, ogłoszenia, wynajmu, wynajęcie, wynajęcia, najmu, najem, darmo, darmowe, domy, pokoje, lokale, użytkowe, biura, wirtualne, miejsca, postojowe, coworking',
              en: 'map, lease, rent, real, estate, property, properties, apartments, free, announcements, houses, rooms, usable, premises, offices, virtual, parking, spaces, coworking',
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              pl: 'Bezpłatne ogłoszenia wynajmu nieruchomości na mapie. Mieszkania, pokoje, lokale użytkowe, biura i inne nieruchomości na wynajem.',
              en: 'Free property rental listings on a map. Apartments, rooms, usable premises, offices, and other properties for rent.',
            }.freeze
          end

          def render
            {
              'visitor': true,
              'announcement': true,
              'announcement/index': true,
              "announcement/index/#{venue}": true,
            }
          end

          def links
            super.merge(
              ::MapawynajmuPl::Api::Tracks::Root::Linker.new(lang, url).category_links,
              ::MapawynajmuPl::Api::Tracks::Root::Linker.new(lang, url).lang_links,
            )
          end

          def current_category_title
            "#{category_from_path[:name_plural][lang]} #{FOR_LEASE[lang]}"
          end

          def get_root_path(lang)
            return '' if lang == :pl

            ROOT_EN
          end
        end
      end
    end
  end
end
