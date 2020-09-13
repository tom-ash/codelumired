module GeneralCiphers
  private

  def encrypt_with_random_iv_and_salt
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.encrypt
    iv = Base64.encode64(cipher.random_iv)
    cipher.key = Base64.decode64(@key)
    [Base64.encode64(cipher.update([@record, SecureRandom.hex(16).upcase].to_s) + cipher.final), iv]
  end

  def encrypt_with_fixed_iv_and_salt
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.encrypt
    cipher.iv = Base64.decode64(@iv)
    cipher.key = Base64.decode64(@key)
    Base64.encode64(cipher.update([@record, @salt].to_s) + cipher.final)
  end

  def decrypt
    decipher = OpenSSL::Cipher.new('AES-256-CBC')
    decipher.decrypt
    decipher.key = Base64.decode64(@key)
    decipher.iv = Base64.decode64(@iv)
    JSON.parse((decipher.update(Base64.decode64(@encrypted_record)) + decipher.final))[0]
  end
end
