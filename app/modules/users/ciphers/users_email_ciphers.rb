module UsersEmailCiphers
  def encrypt_email
    prepare_encryption_params
    @encrypted_email, @email_derived_cipher_id = encrypt_with_derived_cipher
  end
      
  def decrypt_email
    prepare_decryption_params
    @email = decrypt
  end

  private

  def prepare_encryption_params
    @record = @email
    prepare_key
    @salt = Rails.application.secrets.email_salt
  end

  def prepare_decryption_params
    @encrypted_record = @user.encrypted_email
    prepare_key
    @iv = DerivedCipher.find(UserCipher.find(@user.id).email_derived_cipher_id).iv
  end

  def prepare_key
    @key = Rails.application.secrets.email_key
  end
end

