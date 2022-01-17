# frozen_string_literal: true

module Api
  class Sitemap < Grape::API
    helpers do
      def shared_sitemaps
        [
          ::Api::Methods::Page::Sitemap
        ]
      end
    end

    get do
      link_groups = []

      sitemaps.each do |mapper|
        link_groups += mapper.get
      end

      shared_sitemaps.each do |mapper|
        link_groups += mapper.get(site, langs)
      end

      link_groups
    end
  end
end
