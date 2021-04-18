# frozen_string_literal: true

module Serializers
  module Page
    class Show
      include SiteName

      def initialize(page:, site_name:)
        @page = page
        @site_name = site_name
      end

      def call
        page.slice(
          :name, :url, :lang,
          :body, :style, :meta,
          :canonical_url, :title, :description, :keywords, :picture
        ).merge(lang_ver_urls: lang_ver_urls)
      end

      private

      attr_reader :page, :site_name

      def lang_ver_urls
        site::Page.where(name: page.name).pluck(:lang, :url).to_h
      end
    end
  end
end
