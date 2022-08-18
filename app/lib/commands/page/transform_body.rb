# frozen_string_literal: true

module Commands
  module Page
    class TransformBody
      include SiteName

      def initialize(attrs)
        @page = attrs[:page]
        @constantized_site_name = attrs[:constantized_site_name]
        @bucket = attrs[:bucket]
      end

      def call
        transform_body
        backup_page
      end

      private

      attr_reader :page, :constantized_site_name, :bucket

      def transform_body
        article = page.body[0]
        article_data = article['article']
        new_article_data = []

        article_data.each_with_index do |e, i|
          if e.class == Hash && e['main']
            new_article_data = new_article_data + e['main']
          else
            new_article_data << e
          end
        end

        article['article'] = new_article_data
        page.body[0] = article
        page.save!
      end

      def backup_page
        ::Commands::S3Object::Upload.new(
          bucket: bucket,
          key: backup_key,
          body: page.to_json
        ).call
      end

      def backup_key
        "pages/#{page.url} (#{page.updated_at})"
      end
    end
  end
end
