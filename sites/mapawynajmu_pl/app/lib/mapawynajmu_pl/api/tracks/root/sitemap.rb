# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Sitemap
          class << self
            def get
              [map_links] + category_links
            end

            private

            def map_links
              [
                { path: '', lang: :pl, changefreq: 'daily', priority: '1.0' },
                { path: 'en', lang: :en, changefreq: 'daily', priority: '1.0' }
              ]
            end

            def category_links
              langs = [:pl, :en]

              prefix = { pl: 'wynajem', en: 'rent' }

              venues = { map: { pl: 'mapa', en: 'map' } }

              category_link_groups = []

              ::MapawynajmuPl::Listing::CATEGORIES.each_value do |category|
                venues.each do |venue|
                  category_link_group = []

                  langs.each do |lang|
                    category_link_group << {
                      path: "#{prefix[lang]}/#{category[:urlified_plural][lang]}",
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
