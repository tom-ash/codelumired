# frozen_string_literal: true

module Ciphers
  class Decrypt
    CIPHER_TYPE = 'AES-256-CBC'

    def initialize(attrs)
      @encrypted_record = attrs[:encrypted_record]
      @key = attrs[:key]
      @iv = attrs[:iv]
    end

    def call
      cipher.decrypt
      cipher.key = Base64.decode64(key)
      cipher.iv = Base64.decode64(iv)

      decrypted_record
    end

    private

    attr_reader :encrypted_record, :key, :iv

    def cipher
      @cipher ||= OpenSSL::Cipher.new(CIPHER_TYPE)
    end

    def decrypted_record
      JSON.parse((cipher.update(Base64.decode64(encrypted_record)) + cipher.final))[0]
    end
  end
end
