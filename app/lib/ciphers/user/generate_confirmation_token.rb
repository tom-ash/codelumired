# frozen_string_literal: true

module Ciphers
  module User
    class GenerateConfirmationToken
      def initialize(user)
        @user = user
      end

      def call
        user.assign_attributes(encrypted_confirmation_token: encrypted_confirmation_token, access_token_date: Date.today)

        confirmation_token
      end

      private

      attr_reader :user

      def confirmation_token
        @confirmation_token ||= SecureRandom.hex(64)
      end

      def encrypted_confirmation_token
        @encrypted_confirmation_token ||= ::Ciphers::User::EncryptConfirmationToken.new(confirmation_token).call
      end
    end
  end
end
