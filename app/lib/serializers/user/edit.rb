# frozen_string_literal: true

module Serializers
  module User
    class Edit
      include SiteName

      def initialize(user:, constantized_site_name:)
        @user = user
        @constantized_site_name = constantized_site_name
      end

      def call
        {
          accountType: user.account_type,
          businessName: user.business_name,
          email: user.email,
          countryCode: user.country_code,
          phoneNumber: user.phone_number,
          role: user.role,
          authorized: true,
        }
      end

      private

      attr_reader :user, :constantized_site_name
    end
  end
end
