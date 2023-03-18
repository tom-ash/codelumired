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
        json_body = page.body.to_json

        json_body = json_body.gsub('"id":', '"identifier":')
        json_body = json_body.gsub('"class_name":', '"className":')
        json_body = json_body.gsub('"st":', '"style":')
        json_body = json_body.gsub('"code_lang":', '"codeLang":')

        json_body = json_body.gsub('"header":', '"Header":')
        json_body = json_body.gsub('"main":', '"Main":')
        json_body = json_body.gsub('"article":', '"Article":')
        json_body = json_body.gsub('"section":', '"Section":')
        json_body = json_body.gsub('"div":', '"Division":')
        json_body = json_body.gsub('"def":', '"Definition":')
        json_body = json_body.gsub('"definition":', '"body":')
        json_body = json_body.gsub('"h1":', '"HeadingOne":')
        json_body = json_body.gsub('"h2":', '"HeadingTwo":')
        json_body = json_body.gsub('"h3":', '"HeadingThree":')
        json_body = json_body.gsub('"heading_one":', '"HeadingOne":')
        json_body = json_body.gsub('"heading_two":', '"HeadingTwo":')
        json_body = json_body.gsub('"heading_three":', '"HeadingThree":')
        json_body = json_body.gsub('"heading_four":', '"HeadingFour":')
        json_body = json_body.gsub('"editorial":', '"Editorial":')
        json_body = json_body.gsub('"toc":', '"TableOfContents":')
        json_body = json_body.gsub('"ul":', '"UnorderedList":')
        json_body = json_body.gsub('"img":', '"Image":')
        json_body = json_body.gsub('"image":', '"Image":')
        json_body = json_body.gsub('"code":', '"Code":')
        json_body = json_body.gsub('"yte":', '"YouTubeEmbed":')

        page.body = JSON.parse(json_body)
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
