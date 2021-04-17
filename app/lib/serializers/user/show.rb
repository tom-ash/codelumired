# frozen_string_literal: true

module Serializers
  module User
    class Show
      include SiteName
      include Camelize

      def initialize(user:, site_name:)
        @user = user
        @site_name = site_name
      end

      def call
        camelize(
          account_type: user.account_type,
          name: user.try(:first_name) || user.try(:business_name),
          role: user.role,
          authorized: true
        )
      end

      private

      attr_reader :user, :site_name
    end
  end
end
