# frozen_string_literal: true

module JWT
  class Encoder
    ALGORITHM = 'ED25519'
    SIGNING_KEY = ENV['JWT_SECRET']

    def initialize(payload)
      @payload = payload
    end

    def call
      JWT.encode(payload, private_key, ALGORITHM)
    end

    private

    attr_reader :payload

    def private_key
      RbNaCl::Signatures::Ed25519::SigningKey.new(SIGNING_KEY)
    end
  end
end
