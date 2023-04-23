# frozen_string_literal: true

module Ciphers
  module Jwt
    class Decoder
      ALGORITHM = 'ED25519'
      SIGNING_KEY = ENV['JWT_SECRET']

      def initialize(payload)
        @payload = payload
      end

      def call
        OpenStruct.new(JWT.decode(payload, public_key, true, algorithm: ALGORITHM)[0])
      end

      private

      attr_reader :payload

      def private_key
        RbNaCl::Signatures::Ed25519::SigningKey.new(SIGNING_KEY)
      end

      def public_key
        private_key.verify_key
      end
    end
  end
end
