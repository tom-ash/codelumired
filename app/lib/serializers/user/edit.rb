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
            email: user.email,
            country_code: user.country_code,
            phone_number: user.phone_number,
            name: user.try(:first_name) || user.try(:business_name),
            role: user.role,
            authorized: true
          }.merge(account_type_specific_attributes)
      end

      private

      attr_reader :user, :constantized_site_name

      def account_type_specific_attributes
        return { business_name: @user.business_name, tax_number: @user.tax_number } if user.professional_account?

        { first_name: user.first_name, last_name: user.last_name }
      end
    end
  end
end
