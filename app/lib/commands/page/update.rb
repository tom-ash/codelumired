# frozen_string_literal: true

module Commands
  module Page
    class Update
      include SiteName

      PAGE_UPDATE_ATTRS = %w[url body style meta canonical_url title description keywords picture online].freeze

      def initialize(attrs)
        @attrs = attrs
        @constantized_site_name = attrs[:constantized_site_name]
        @bucket = attrs[:bucket]
      end

      def call
        page.update!(attrs.slice(*PAGE_UPDATE_ATTRS))

        s3_client = Aws::S3::Client.new(region: Rails.application.secrets.aws_region)

        page_date = page.updated_at
        page_lang = page.lang
        page_name = page.name

        key = "pages/#{page_name} #{page_lang} (#{page_date})"

        s3_client.put_object(
          bucket: bucket,
          key: key,
          body: page.to_json
        )

        page
      end

      private

      attr_reader :attrs, :constantized_site_name, :bucket

      def page
        @page ||= site::Page.find_by!(name: attrs[:name], lang: attrs[:lang])
      end

      def user
        @user ||= site::User.find(attrs[:user_id])
      end
    end
  end
end
