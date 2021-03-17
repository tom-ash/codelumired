# frozen_string_literal: true

module Ciphers
  module User
    class DecryptAccessToken
      def initialize(encrypted_access_token)
        @encrypted_access_token = encrypted_access_token
        @key = Rails.application.secrets.access_token_key
        @iv = Rails.application.secrets.access_token_iv
      end

      def call
        ::Ciphers::Decrypt.new(
          encrypted_record: encrypted_access_token,
          key: key,
          iv: iv
        ).call
      end

      private

      attr_reader :encrypted_access_token, :key, :iv
    end
  end
end
