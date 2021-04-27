# frozen_string_literal: true

module Ciphers
  module User
    class EncryptConfirmationToken
      def initialize(confirmation_token)
        @confirmation_token = confirmation_token

        @key = Rails.application.secrets.access_token_key
        @iv = Rails.application.secrets.access_token_iv
        @salt = Rails.application.secrets.access_token_salt
      end

      def call
        ::Ciphers::Encrypt.new(record: confirmation_token, key: key, iv: iv, salt: salt).call[:encrypted_record]
      end

      private

      attr_reader :confirmation_token, :key, :iv, :salt
    end
  end
end
