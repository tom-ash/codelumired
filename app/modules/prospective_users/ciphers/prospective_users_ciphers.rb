module ProspectiveUsersCiphers
  private

  def find_prospective_user_with_token
    encrypt_token
    @prospective_user = ProspectiveUser.find_by(encrypted_token: @encrypted_token)
    return false unless @prospective_user

    @prospective_user_cipher = ProspectiveUserCipher.find(@prospective_user.id)
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
