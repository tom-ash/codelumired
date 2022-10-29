# frozen_string_literal: true

module Queries
  module User
    class SingleByEmail
      include SiteName

      def initialize(email:, constantized_site_name:)
        @email = email
        @constantized_site_name = constantized_site_name
      end

      def call
        {
          account_type: user.account_type,
          access_token: ::Ciphers::User::DecryptAccessToken.new(user.encrypted_access_token).call,
        }
      end

      private

      attr_reader :email, :constantized_site_name

      def user
        @user ||= begin
          site::User.find_by(email: email)
        end
      end
    end
  end
end
