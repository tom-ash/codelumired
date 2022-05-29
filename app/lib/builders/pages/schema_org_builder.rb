# frozen_string_literal: true

module Builders
  module Pages
    class SchemaOrgBuilder
      def initialize(page:, domain_url:, bucket:)
        @page = page
        @domain_url = domain_url
        @bucket = bucket
      end

      def call
        page.update!(
          auto_schema: auto_schema,
          manual_schema: manual_schema
        )
      end

      private

      attr_reader :page, :domain_url, :bucket
      delegate :lang,
               :title,
               :description,
               :keywords,
               :published_on,
               :modified_on,
               :picture,
               :url,
               :category, to: :page

      def auto_schema
        { '@type': type }.merge(shared_schema)
      end

      def manual_schema
        page.manual_schema.merge(shared_schema)
      end

      def shared_schema
        {
          '@context': 'https://schema.org',
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
      end

      def type
        case category
        when 'tutorials'
          'CreativeWork'
        when 'insights'
          'CreativeWork'
        when 'articles'
          'Article'
        else
          'WebSite'
        end
      end
    end
  end
end
