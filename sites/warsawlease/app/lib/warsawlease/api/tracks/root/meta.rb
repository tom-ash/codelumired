# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Root
        module Meta
          TRACK = 'root'

          UNLOCALIZED_PATH = {
            pl: %r{^/$|^warszawa/wynajem/nieruchomosci/(?<venue_name>mapa|katalog)/?(?<category_name>#{::Warsawlease::Announcement::URL_CATEGORIES})?$},
            en: %r{^en$|^property/(?<venue_name>map|catalogue)/?(?<category_name>#{::Warsawlease::Announcement::URL_CATEGORIES})?$}
          }.freeze

          UNLOCALIZED_TITLE = {
            pl: 'Ogłoszenia wynajmu nieruchomości w Warszawie | Mapa',
            en: 'Real Estate Lease Announcements in Warsaw | Map'
          }.freeze

          FOR_LEASE_IN_WARSAW = { pl: 'do wynajęcia w Warszawie', en: 'for lease in Warsaw' }.freeze
          TITLEIZED_VENUE = { map: { pl: 'Mapa', en: 'Map' }, catalogue: { pl: 'Katalog', en: 'Catalogue' } }.freeze

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
            "#{::Warsawlease::Announcement::CATEGORIES[category][:plural_name][lang]} #{FOR_LEASE_IN_WARSAW[lang]} | #{TITLEIZED_VENUE[venue.to_sym][lang]}"
          end

          def match_data
            @match_data ||= UNLOCALIZED_PATH[lang].match(url)
          end

          def category
            @category ||= begin
              category_name = match_data && match_data[:category_name]
              return if category_name.blank?

              ::Warsawlease::Announcement::CATEGORIES.each do |key, value|
                return key if value[:plural_urlified][lang] == category_name
              end
            end
          end

          def venue
            @venue ||= begin
              return :catalogue if match_data[:venue_name] && match_data[:venue_name].match?(/katalog|catalogue/)

              :map
            end
          end

          def unlocalized_path
            @unlocalized_path ||= UNLOCALIZED_PATH
          end

          def unlocalized_title
            @unlocalized_title ||= UNLOCALIZED_TITLE
          end

          def unlocalized_keywords
            @unlocalized_keywords ||= {
              pl: 'ogłoszenia, oferty, wynajem, najem, nieruchomości, warszawa, mapa, bezpłatne, bezpłatnie, darmowe, za darmo, mieszkania, domy, pokoje, miejsca parkingowe, lokale użytkowe, biura, biura wirtualne, coworking',
              en: 'announcements, offers, lease, rent, real estate, warsaw, map, free, apartments, flats, houses, rooms, parking spaces, usable premises, offices, virtual offices, coworking'
            }.freeze
          end

          def unlocalized_description
            @unlocalized_description ||= {
              pl: 'Ogłoszenia nieruchomości na wynajem w Warszawie na mapie. Za darmo dodaj ogłoszenie wynajmu między innymi mieszkania, pokoju, biura lub lokalu użytkowego.',
              en: 'Warsaw real estate lease announcements on a map. Add a free lease announcement of among others an apartment, a room, an office and/or usable premises.'
            }.freeze
          end

          def render
            {
              'visitor': true,
              'announcement': true,
              'announcement/index': true,
              "announcement/index/#{venue}": true,
              'page': true,
              'page/show': true
            }
          end

          def links
            {}.merge(
              ::Warsawlease::Api::Tracks::Root::Linker.new(lang, url).venue_links.merge,
              ::Warsawlease::Api::Tracks::Root::Linker.new(lang, url).category_links(venue),
              ::Warsawlease::Api::Tracks::Root::Linker.new(lang, url).lang_links(venue)
            )
          end

          def asset_names
            @asset_names ||= %i[apartment house room parkingSpace usablePremises office virtualOffice coworkingSpace facebook chevron close phone]
          end

          def canonical_url
            ::Warsawlease::Api::Tracks::Root::Linker.new(lang, url).lang_links(:map)["current/#{lang}".to_sym][:path]
          end
        end
      end
    end
  end
end
