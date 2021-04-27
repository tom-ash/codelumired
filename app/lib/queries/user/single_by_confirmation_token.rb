# frozen_string_literal: true

module Queries
  module User
    class SingleByConfirmationToken
      include SiteName

      def initialize(confirmation_token:, site_name:)
        @confirmation_token = confirmation_token
        @site_name = site_name
      end

      def call
        user
      end

      private

      attr_reader :confirmation_token, :site_name

      def user
        site::User.find_by(encrypted_confirmation_token: encrypted_confirmation_token)
      end

      def encrypted_confirmation_token
        ::Ciphers::User::EncryptConfirmationToken.new(confirmation_token).call
      end
    end
  end
end
