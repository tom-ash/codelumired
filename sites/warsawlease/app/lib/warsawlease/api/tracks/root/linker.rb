# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Root
        class Linker
          include ::Warsawlease::Api::Tracks::Helpers::Linker
          include ::Warsawlease::Api::Tracks::Root::Meta

          def call
            url
          end

          def venue_links
            {
              'root/map': "#{root_domain}/#{venue_path(:map, lang)}".chomp('/'),
              'root/catalogue': "#{root_domain}/#{venue_path(:catalogue, lang)}"
            }
          end

          def category_links(venue)
            category_links_hash = {}

            ::Warsawlease::Announcement::CATEGORIES.each_value do |category|
              category_links_hash["root/#{venue}/#{category[:name][:en].downcase}"] = category_link(category, lang)
            end

            category_links_hash
          end

          private

          def url
            { pl: root_domain, en: "#{root_domain}/en" }[lang]
          end

          def venue_path(venue, lang)
            case venue
            when :mp
              lang == :pl ? '' : 'en'
            when :catalogue
              lang == :pl ? 'warszawa/wynajem/nieruchomosci/katalog' : 'property/catalogue'
            end
          end

          def category_link(category, lang)
            "#{root_domain}/#{category_venue_path(venue, lang)}/#{category[:plural_urlified][lang]}"
          end

          def category_venue_path(venue, lang)
            case lang
            when :pl
              venue == :map ? 'warszawa/wynajem/nieruchomosci/mapa' : 'warszawa/wynajem/nieruchomosci/katalog'
            when :en
              venue == :catalogue ? 'property/map' : 'property/catalogue'
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
