# frozen_string_literal: true

module Serializers
  module Page
    class Show
      include SiteName

      def initialize(page:, constantized_site_name:)
        @page = page
        @constantized_site_name = constantized_site_name
      end

      def call
        page.slice(
          :id,
          :url,
          :lang,
          :body,
          :style,
          :meta,
          :canonical_url,
          :title,
          :description,
          :keywords,
          :picture,
          :online,
          :header_autonumbering,
          :schema_mode,
          :auto_schema,
          :manual_schema,
          :published_on,
          :modified_on,
          :category,
          :subcategory,
          :link_data,
          :lang_alts_group
        ).merge(lang_ver_urls: lang_ver_urls, schema: schema)
      end

      private

      attr_reader :page, :constantized_site_name

      def lang_ver_urls
        site::Page.where(lang_alts_group: page.lang_alts_group).pluck(:lang, :url).to_h
      end

      def schema
        page[:schema_mode] == 'auto' ? page[:auto_schema] : page[:manual_schema]
      end
    end
  end
end
