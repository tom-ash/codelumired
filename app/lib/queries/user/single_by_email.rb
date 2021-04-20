# frozen_string_literal: true

module Queries
  module User
    class SingleByEmail
      include SiteName

      def initialize(email:, site_name:)
        @email = email
        @site_name = site_name
      end

      def call
        {
          account_type: user.account_type,
          access_token: ::Ciphers::User::DecryptAccessToken.new(user.encrypted_access_token).call,
          name: user.try(:first_name) || user.try(:business_name)
        }
      end

      private

      attr_reader :email, :site_name

      def user
        @user ||= begin
          site::User.find_by(email: email)
        end
      end
    end
  end
end
