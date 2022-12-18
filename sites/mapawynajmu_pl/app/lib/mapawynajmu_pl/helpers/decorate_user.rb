# frozen_string_literal: true

module MapawynajmuPl
  module Helpers
    class DecorateUser
      def initialize(user:, attrs:)
        @user = user
        @attrs = attrs
        @account_type = attrs[:account_type]
      end

      def call
        assign_phone
        assign_points
        assign_account_type
        assign_business_name if business_account_type?
        build_showcase
      end

      private

      attr_reader :user, :attrs, :account_type

      def assign_phone
        user.assign_attributes(
          country_code: attrs[:country_code],
          phone_number: attrs[:phone_number],
          phone: {},
        )
      end

      def assign_points
        user.assign_attributes(points: 0)
      end

      def assign_account_type
        user.assign_attributes(account_type: account_type)
      end

      def assign_business_name
        user.assign_attributes(business_name: attrs[:business_name])
      end

      def business_account_type?
        account_type == 'business'
      end

      def build_showcase
        ::MapawynajmuPl::Builders::User::Showcase.new(user).call
      end
    end
  end
end
