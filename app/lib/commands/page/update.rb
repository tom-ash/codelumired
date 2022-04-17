# frozen_string_literal: true

module Commands
  module Page
    class Update
      include SiteName

      PAGE_UPDATE_ATTRS = %w[
        url
        body
        style
        meta
        canonical_url
        title
        description
        keywords
        picture
        online
        header_autonumbering
        schema_mode
        auto_schema
        manual_schema
        published_on
        modified_on
      ].freeze

      def initialize(attrs)
        @attrs = attrs
        @constantized_site_name = attrs[:constantized_site_name]
        @bucket = attrs[:bucket]
      end

      def call
        update_page
        backup_page
        page
      end

      private

      attr_reader :attrs, :constantized_site_name, :bucket

      def update_page
        page.update!(attrs.slice(*PAGE_UPDATE_ATTRS))
      end

      def backup_page
        ::Commands::S3Object::Upload.new(
          bucket: bucket,
          key: backup_key,
          body: page.to_json
        ).call
      end

      def page
        @page ||= site::Page.find_by!(name: attrs[:name], lang: attrs[:lang])
      end

      def backup_key
        "pages/#{page.name} #{page.lang} (#{page.updated_at})"
      end
    end
  end
end
