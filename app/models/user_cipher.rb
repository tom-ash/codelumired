class UserCipher < ApplicationRecord
  def self.create_secrets
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.encrypt
    key = cipher.key = cipher.random_key
    iv = Base64.encode64(cipher.random_iv)
    cipher.final
    salt = SecureRandom.hex(32)

    puts 'key:'
    puts Base64.encode64(key)
    puts 'iv:'
    puts iv
    puts 'salt:'
    puts salt
  end
end
