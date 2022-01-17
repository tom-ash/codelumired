# frozen_string_literal: true

module Serializers
  module User
    class Show
      include SiteName

      def initialize(user:, constantized_site_name:)
        @user = user
        @constantized_site_name = constantized_site_name
      end

      def call
        {
          account_type: user.account_type,
          name: user.try(:first_name) || user.try(:business_name),
          role: user.role,
          authorized: true
        }
      end

      private

      attr_reader :user, :constantized_site_name
    end
  end
end
