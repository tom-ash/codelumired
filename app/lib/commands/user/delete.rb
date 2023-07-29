# frozen_string_literal: true

module Commands
  module User
    class Delete
      include SiteName

      def initialize(user_id:, constantized_site_name:)
        @user_id = user_id
        @constantized_site_name = constantized_site_name
      end

      def call
        user.soft_delete!
      end

      private

      attr_reader :user_id, :constantized_site_name

      def user
        @user ||= site::User.find(user_id)
      end
    end
  end
end
