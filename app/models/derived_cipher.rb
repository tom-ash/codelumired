class DerivedCipher < ApplicationRecord
  def self.create_derived_ciphers
    1024.times do
      cipher = OpenSSL::Cipher.new('AES-256-CBC')
      cipher.encrypt
      cipher.key = cipher.random_key
      iv = Base64.encode64(cipher.random_iv)
      cipher.final
      salt = SecureRandom.hex(32)
      DerivedCipher.create({ iv: iv, salt: salt })
    end
  end
end
