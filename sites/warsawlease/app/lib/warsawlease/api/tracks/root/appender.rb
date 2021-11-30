# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Root
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Warsawlease::Api::Tracks::Root::Meta
          include ::Warsawlease::Api::Announcement::Tracks::Helpers::Announcements
          include ::Warsawlease::Api::Announcement::Tracks::Helpers::Filters

          def call
            merge_state
            super
          end

          private

          def merge_state
            state.merge!(
              'announcement/index/data': data,
              'announcement/index/inputs': inputs,
              links: venue_links.merge(category_links)
            )
          end

          def data
            {
              announcements: serialized_announcements,
              amount: serialized_announcements.count,
              current_category: category
            }
          end

          def venue_links
            {
              'root/map': { pl: root_domain, en: "#{root_domain}/en" }[lang],
              'root/catalogue': {
                pl: "#{root_domain}/warszawa/wynajem/nieruchomosci/katalog",
                en: "#{root_domain}/property/catalogue"
              }[lang]
            }
          end

          def category_links
            category_links_hash = {}

            ::Warsawlease::Announcement::CATEGORIES.each_value do |category|
              category_links_hash["root/#{venue}/#{category[:name][:en].downcase}"] = category_link(category, lang)
            end

            category_links_hash
          end

          def category_link(category, lang)
            "#{root_domain}/#{venue_link(lang)}/#{category[:plural_urlified][lang]}"
          end

          def venue_link(lang)
            case lang
            when :pl
              venue == 'map' ? 'warszawa/wynajem/nieruchomosci/mapa' : 'warszawa/wynajem/nieruchomosci/katalog'
            when :en
              venue == 'map' ? 'property/map' : 'property/catalogue'
            end
          end

          def root_domain
            return 'http://local.warsawlease.pl:8080' if Rails.env == 'development'

            'https://www.warsawlease.pl'
          end
        end
      end
    end
  end
end
