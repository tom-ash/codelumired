# frozen_string_literal: true

module Ciphers
  module User
    class EncryptAccessToken
      def initialize(access_token)
        @access_token = access_token
        @key = Rails.application.secrets.access_token_key
        @iv = Rails.application.secrets.access_token_iv
        @salt = Rails.application.secrets.access_token_salt
      end

      def call
        ::Ciphers::Encrypt.new(record: access_token, key: key, iv: iv, salt: salt).call[:encrypted_record]
      end

      private

      attr_reader :access_token, :key, :iv, :salt
    end
  end
end
