# frozen_string_literal: true

module MapawynajmuPl
  module Helpers
    class DecorateUser
      def initialize(user:, attrs:)
        @user = user
        @attrs = attrs
      end

      def call
        assign_phone
        assign_points
        assing_account_type
        build_showcase
      end

      private

      attr_reader :user, :attrs

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

      def assing_account_type
        user.assign_attributes(account_type: attrs[:account_type])
      end

      def build_showcase
        ::MapawynajmuPl::Builders::User::Showcase.new(user).call
      end
    end
  end
end
