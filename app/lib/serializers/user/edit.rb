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
          account_type: user.account_type,
          business_name: user.business_name,
          email: user.email,
          country_code: user.country_code,
          phone_number: user.phone_number,
          role: user.role,
          authorized: true,
        }
      end

      private

      attr_reader :user, :constantized_site_name
    end
  end
end
