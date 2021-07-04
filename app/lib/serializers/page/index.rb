# frozen_string_literal: true

module Serializers
  module Page
    class Index
      include SiteName

      def initialize(pages:, site_name:)
        @pages = pages
        @site_name = site_name
      end

      def call
        page_names_with_urls
      end

      private

      attr_reader :pages, :site_name

      def page_names_with_urls
        page_names_with_urls = {}
        pages.each do |page|
          urls = page_names_with_urls[page.name] || {}
          urls[page.lang] = page.url
          page_names_with_urls[page.name] = urls
        end
        page_names_with_urls
      end
    end
  end
end
