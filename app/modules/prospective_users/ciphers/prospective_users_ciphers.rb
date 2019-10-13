module ProspectiveUsersCiphers
  private

  def generate_prospective_user_search_token
    @search_token = SecureRandom.hex(32)
    @encrypted_search_token = encrypt_prospective_user_search_token
  end

  def encrypt_prospective_user_search_token
    @record = @search_token
    @key = Rails.application.secrets.search_token_key
    @iv = Rails.application.secrets.search_token_iv
    @salt = Rails.application.secrets.search_token_salt
    encrypt_with_fixed_iv_and_salt
  end

  def find_prospective_user_with_search_token
    @prospective_user = ProspectiveUser.find_by(encrypted_search_token: encrypt_prospective_user_search_token)
  end

  def decrypt_verification_code_for_prospective_user
    @encrypted_record = @prospective_user.verification['encrypted_code']
    @key = Rails.application.secrets.verification_code_key
    @iv = ProspectiveUserCipher.find(@prospective_user.id).verification_code_iv
    decrypt
  end

  def decrypt_business_name_from_prospective_user
    @encrypted_record = @user_object[:encrypted_business_name]
    @key = Rails.application.secrets.business_name_key
    @iv = @user_cipher_object[:business_name_iv]
    decrypt
  end

  def decrypt_phone_body_from_prospective_user
    @encrypted_record = @user_object[:phone][:encrypted_body]
    @key = Rails.application.secrets.phone_body_key
    @iv = @user_cipher_object[:phone_body_iv]
    decrypt
  end
end
