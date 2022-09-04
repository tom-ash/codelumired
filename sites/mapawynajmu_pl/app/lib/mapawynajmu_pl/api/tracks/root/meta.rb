# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        module Meta
          TRACK = 'root'

          UNLOCALIZED_PATH = {
            pl: %r{^/$|^wynajem/(?<category_name>#{::MapawynajmuPl::Announcement::URL_CATEGORIES})?$},
            en: %r{^en$|^rent/(?<category_name>#{::MapawynajmuPl::Announcement::URL_CATEGORIES})?$}
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: 'Nieruchomości na wynajem',
            en: 'Properties for Rent'
          }.freeze

          FOR_LEASE = { pl: 'na wynajem', en: 'for rent' }.freeze

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
            "#{::MapawynajmuPl::Announcement::CATEGORIES[category][:plural_name][lang]} #{FOR_LEASE[lang]}"
          end

          def match_data
            @match_data ||= UNLOCALIZED_PATH[lang].match(url)
          end

          def category
            @category ||= begin
              category_name = match_data && match_data[:category_name]
              return if category_name.blank?

              ::MapawynajmuPl::Announcement::CATEGORIES.each do |key, value|
                return key if value[:plural_urlified][lang] == category_name
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
              en: 'map, lease, rent, real, estate, property, properties, apartments, free, announcements, houses, rooms, usable, premises, offices, virtual, parking, spaces, coworking'
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              pl: 'Bezpłatne ogłoszenia wynajmu nieruchomości na mapie. Mieszkania, pokoje, lokale użytkowe, biura i inne nieruchomości na wynajem.',
              en: 'Free property rental listings on a map. Apartments, rooms, usable premises, offices, and other properties for rent.'
            }.freeze
          end

          def render
            {
              'visitor': true,
              'announcement': true,
              'announcement/index': true,
              "announcement/index/#{venue}": true
            }.merge(page_render)
          end

          def links
            {}.merge(
              ::MapawynajmuPl::Api::Tracks::Root::Linker.new(lang, url).category_links,
              ::MapawynajmuPl::Api::Tracks::Root::Linker.new(lang, url).lang_links
            )
          end

          def asset_names
            @asset_names ||= %i[calendar apartment house room parkingSpace usablePremises office virtualOffice coworkingSpace facebook chevron close phone caretDown]
          end

          def page_render
            return {} if accessory_page.blank?

            {
              'page': true,
              'page/show': true
            }
          end
        end
      end
    end
  end
end
