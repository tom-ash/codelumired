# frozen_string_literal: true

module Commands
  module Page
    class Create
      include SiteName

      DEFAULT_LANG = :en

      def initialize(user_id:, constantized_site_name:)
        @user_id = user_id
        @constantized_site_name = constantized_site_name
      end

      def call
        user.pages.create!(
          url: SecureRandom.hex(32),
          lang: DEFAULT_LANG,
          body: [],
          canonical_url: '',
          title: '',
          keywords: '',
          description: '',
          picture: '',
          lang_alts_group: SecureRandom.uuid
        )
      end

      private

      attr_reader :user_id, :constantized_site_name

      def user
        @user ||= site::User.find(user_id)
      end
    end
  end
end
