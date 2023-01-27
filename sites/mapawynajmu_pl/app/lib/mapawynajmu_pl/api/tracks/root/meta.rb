# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        module Meta
          TRACK = 'root'

          ROOT_PL = '/'
          CATEGORY_PL = "wynajem/(?<category_name>#{::MapawynajmuPl::Announcement::URL_CATEGORIES})$"
          PARTNER_PL = "partnerzy\/(?<partner_name>[^\/]*)(\/#{CATEGORY_PL})?"

          ROOT_EN = 'en'
          CATEGORY_EN = "rent/(?<category_name>#{::MapawynajmuPl::Announcement::URL_CATEGORIES})"
          PARTNER_EN = "partners\/(?<partner_name>[^\/]*)(\/#{CATEGORY_EN})?"

          UNLOCALIZED_PATH = {
            pl: /^#{ROOT_PL}|#{CATEGORY_PL}|#{PARTNER_PL}$/,
            en: /^#{ROOT_EN}|#{CATEGORY_EN}|#{PARTNER_EN}$/,
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: 'Nieruchomości na wynajem',
            en: 'Properties for Rent',
          }.freeze

          FOR_LEASE = { pl: 'na wynajem', en: 'for rent' }.freeze
          ON_MAP = { pl: 'na mapie', en: 'on a Map' }.freeze

          private

          def track
            @track ||= TRACK
          end

          def title
            @title ||= begin
              return category_title if category.present?

              unlocalized_title[lang]
            end
          end

          def category_title
            "#{::MapawynajmuPl::Announcement::CATEGORIES[category][:name_plural][lang]} #{FOR_LEASE[lang]}"
          end

          def match_data
            @match_data ||= UNLOCALIZED_PATH[lang].match(url)
          end

          def partner
            @partner ||= begin
              urlified_business_name = match_data && match_data[:partner_name]
              return if urlified_business_name.blank?

              ::MapawynajmuPl::User.find_by!(urlified_business_name: urlified_business_name)
            end
          end

          def category
            @category ||= begin
              category_name = match_data && match_data[:category_name]
              return if category_name.blank?

              ::MapawynajmuPl::Announcement::CATEGORIES.each do |key, value|
                return key if value[:urlified_plural][lang] == category_name
              end
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
            {}.merge(
              ::MapawynajmuPl::Api::Tracks::Root::Linker.new(lang, url).category_links,
              ::MapawynajmuPl::Api::Tracks::Root::Linker.new(lang, url).lang_links,
            )
          end

          def asset_names
            @asset_names ||= %i[
              arrowRight
              globe
              calendar
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
              facebook
              chevron
              close
              phone
              caretDown
            ]
          end

          def partner_paths
            {
              'current/pl': { path: partner_path(:pl) },
              'current/en': { path: partner_path(:en) },
            }
          end

          def partner_path(lang)
            {
              pl: "partnerzy/#{partner.urlified_business_name}",
              en: "partners/#{partner.urlified_business_name}",
            }[lang]
          end
        end
      end
    end
  end
end
