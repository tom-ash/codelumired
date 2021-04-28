# frozen_string_literal: true

module Ciphers
  module User
    class DecryptConfirmationToken
      def initialize(encrypted_confirmation_token)
        @encrypted_confirmation_token = encrypted_confirmation_token
        @key = Rails.application.secrets.confirmation_token_key
        @iv = Rails.application.secrets.confirmation_token_iv
      end

      def call
        ::Ciphers::Decrypt.new(
          encrypted_record: encrypted_confirmation_token,
          key: key,
          iv: iv
        ).call
      end

      private

      attr_reader :encrypted_confirmation_token, :key, :iv
    end
  end
end
