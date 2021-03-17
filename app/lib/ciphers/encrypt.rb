# frozen_string_literal: true

module Ciphers
  class Encrypt
    CIPHER_TYPE = 'AES-256-CBC'
    SALT_LENGTH = 16

    def initialize(attrs)
      @attrs = attrs
      @key = attrs[:key]
      @record = attrs[:record]
    end

    def call
      cipher.encrypt
      iv
      cipher.key = Base64.decode64(key)
      { encrypted_record: encrypted_record, iv: iv, salt: salt }
    end

    private

    attr_reader :attrs, :key, :record

    def encrypted_record
      Base64.encode64(cipher.update([record, salt].to_s) + cipher.final)
    end

    def cipher
      @cipher ||= OpenSSL::Cipher.new(CIPHER_TYPE)
    end

    def iv
      @iv ||= begin
        attrs_iv = attrs[:iv]
        if attrs_iv.present?
          cipher.iv = Base64.decode64(attrs_iv)
          return attrs_iv
        end

        Base64.encode64(cipher.random_iv)
      end
    end

    def salt
      @salt ||= attrs[:salt] || SecureRandom.hex(SALT_LENGTH)
    end
  end
end
