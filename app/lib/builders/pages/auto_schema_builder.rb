# frozen_string_literal: true

module Builders
  module Pages
    class AutoSchemaBuilder
      def initialize(page:, domain_url:, bucket:)
        @page = page
        @domain_url = domain_url
        @bucket = bucket
      end

      def call
        page.update!(
          auto_schema: {
            '@context': 'https://schema.org',
            '@type': type,
            inLanguage: page.lang,
            name: page.title,
            description: page.description,
            keywords: page.keywords,
            datePublished: page.published_on,
            dateModified: page.modified_on,
            url: "#{domain_url}/#{page.url}",
            isFamilyFriendly: true,
            image: page.picture
          }
        )
      end

      private

      attr_reader :page, :domain_url, :bucket

      def type
        'WebSite'
      end
    end
  end
end
