module UsersCiphers
  include GeneralCiphers
  include UsersEmailCiphers
  include UsersPasswordCiphers
  include UsersTokenCiphers
  include UsersVerificationCiphers

  def encrypt_business_name
    @record = @business_name
    @key = Rails.application.secrets.business_name_key
    @encrypted_business_name, @business_name_iv = encrypt_with_random_iv_and_salt
  end

  def encrypt_tax_identification
    @record = @tax_identification
    @key = Rails.application.secrets.tax_identification_key
    @encrypted_tax_identification, @tax_identification_iv = encrypt_with_random_iv_and_salt
  end

  def encrypt_phone_body
    @record = @phone_body
    @key = Rails.application.secrets.phone_body_key
    @encrypted_phone_body, @phone_body_iv = encrypt_with_random_iv_and_salt
  end

  def decrypt_business_name
    @encrypted_record = @user.encrypted_business_name
    @key = Rails.application.secrets.business_name_key
    @iv = UserCipher.find(@user.id).business_name_iv
    @business_name = decrypt        
  end

  def decrypt_tax_identification
    @encrypted_record = @user.encrypted_tax_identification
    @key = Rails.application.secrets.tax_identification_key
    @iv = UserCipher.find(@user.id).tax_identification_iv
    @tax_identification = decrypt        
  end
  
  def decrypt_phone_body
    @encrypted_record = @user.phone['encrypted_body']
    @key = Rails.application.secrets.phone_body_key
    @iv = @user_cipher.phone_body_iv
    @phone_body = decrypt        
  end
end