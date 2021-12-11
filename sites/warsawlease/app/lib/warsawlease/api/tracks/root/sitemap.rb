# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Root
        class Sitemap
          class << self
            def get
              [map_links, catalogue_links] + category_links
            end

            private

            def map_links
              [
                { path: '', lang: :pl, changefreq: 'daily', priority: '1.0' },
                { path: 'en', lang: :en, changefreq: 'daily', priority: '1.0' }
              ]
            end

            def catalogue_links
              [
                { path: 'warszawa/wynajem/nieruchomosci/katalog', lang: :pl, changefreq: 'daily', priority: '1.0' },
                { path: 'property/catalogue', lang: :en, changefreq: 'daily', priority: '1.0' }
              ]
            end

            def category_links
              langs = [:pl, :en]

              prefix = { pl: 'warszawa/wynajem/nieruchomosci', en: 'property' }

              venues = {
                map: { pl: 'mapa', en: 'map' },
                catalogue: { pl: 'katalog', en: 'catalogue' }
              }

              category_link_groups = []

              ::Warsawlease::Announcement::CATEGORIES.each_value do |category|
                venues.each do |venue, venue_data|
                  category_link_group = []

                  langs.each do |lang|
                    category_link_group << {
                      path: "#{prefix[lang]}/#{venue_data[lang]}/#{category[:plural_urlified][lang]}",
                      lang: lang,
                      changefreq: 'daily',
                      priority: '0.8'
                    }
                  end

                  category_link_groups << category_link_group
                end
              end

              category_link_groups
            end
          end
        end
      end
    end
  end
end
