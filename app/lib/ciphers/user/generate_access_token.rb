# frozen_string_literal: true

module Ciphers
  module User
    class GenerateAccessToken
      def initialize(user)
        @user = user
      end

      def call
        user.assign_attributes(encrypted_access_token: encrypted_access_token, access_token_date: Date.today)

        access_token
      end

      private

      attr_reader :user

      def access_token
        @access_token ||= SecureRandom.hex(64)
      end

      def encrypted_access_token
        @encrypted_access_token ||= ::Ciphers::User::EncryptAccessToken.new(access_token).call
      end
    end
  end
end
