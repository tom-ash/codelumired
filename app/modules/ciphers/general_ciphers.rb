module GeneralCiphers
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

  def encrypt_with_derived_cipher
    calculate_cipher_id
    prepare_derived_cipher_encryption_params
    [encrypt_with_fixed_iv_and_salt, @cipher_id]
  end

  def decrypt
    decipher = OpenSSL::Cipher.new('AES-256-CBC')
    decipher.decrypt
    decipher.key = Base64.decode64(@key)
    decipher.iv = Base64.decode64(@iv)
    JSON.parse((decipher.update(Base64.decode64(@encrypted_record)) + decipher.final))[0]
  end

  private

  def calculate_cipher_id
    hashed_record = (Digest::SHA256.new).base64digest(@record + @salt)
    @cipher_id = 0
    hashed_record.each_codepoint { |codepoint| @cipher_id += codepoint }
    @cipher_id %= 1024
    @cipher_id += 1
  end

  def prepare_derived_cipher_encryption_params
    derived_cipher = DerivedCipher.find(@cipher_id)
    @iv = derived_cipher.iv
    @salt = derived_cipher.salt
  end
end