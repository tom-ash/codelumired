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
          :canonical_url,
          :title,
          :description,
          :keywords,
          :cover_image,
          :online,
          :header_autonumbering,
          :schema_mode,
          :auto_schema,
          :manual_schema,
          :published_on,
          :modified_on,
          :category,
          :subcategory,
          :lang_alts_group,
        ).merge(
          page_lang: page[:lang],
          lang_ver_urls: lang_ver_urls,
          schema_org: schema_org,
        ).merge(
          author: author_data,
          pages: child_pages,
        )
      end

      private

      attr_reader :page, :constantized_site_name

      def lang_ver_urls
        site::Page.where(lang_alts_group: page.lang_alts_group).pluck(:lang, :url).to_h
      end

      def schema_org
        page[:schema_mode] == 'auto' ? page[:auto_schema] : page[:manual_schema]
      end

      def author_data
        author = page.user

        {
          firstName: author.first_name,
          lastName: author.last_name,
          url: author.author_data['url'],
          pictureUrl: author.author_data['pictureUrl'],
        }
      end

      def child_pages
        @child_pages ||= begin
          children = site::Page.where(parent_id: page.id).select(:url, :lang, :title, :cover_image)

          children.map do |child|
            {
              href: "/#{child.url}", # TODO: Change .url -> .path.
              hrefLang: child.lang,
              title: child.title,
              image: child.cover_image,
            }
          end
        end
      end
    end
  end
end
