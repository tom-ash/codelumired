# frozen_string_literal: true

module Commands
  module Page
    class Update
      include SiteName

      PAGE_UPDATE_ATTRS = %w[url body style meta canonical_url title description keywords picture].freeze

      def initialize(attrs)
        @attrs = attrs
        @site_name = attrs[:site_name]
      end

      def call
        page.update!(attrs.slice(*PAGE_UPDATE_ATTRS))
      end

      private

      attr_reader :attrs, :site_name

      def page
        @page ||= site::Page.find_by!(name: attrs[:name], lang: attrs[:lang])
      end

      def user
        @user ||= site::User.find(attrs[:user_id])
      end
    end
  end
end
