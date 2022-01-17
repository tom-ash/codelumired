# frozen_string_literal: true

module Queries
  module User
    class SingleByAccessToken
      include SiteName

      def initialize(access_token:, constantized_site_name:)
        @access_token = access_token
        @constantized_site_name = constantized_site_name
      end

      def call
        user
      end

      private

      attr_reader :access_token, :constantized_site_name

      def user
        site::User.find_by(encrypted_access_token: encrypted_access_token)
      end

      def encrypted_access_token
        ::Ciphers::User::EncryptAccessToken.new(access_token).call
      end
    end
  end
end
