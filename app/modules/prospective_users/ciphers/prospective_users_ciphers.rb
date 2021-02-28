module ProspectiveUsersCiphers
  private

  def find_prospective_user_with_token
    encrypt_access_token
    @prospective_user = site::ProspectiveUser.find_by(encrypted_access_token: @encrypted_access_token)
  end

  def decrypt_verification_code_for_prospective_user
    @encrypted_record = @prospective_user.verification['encrypted_code']
    @key = Rails.application.secrets.verification_code_key
    @iv = @prospective_user.verification_code_iv
    decrypt
  end
end
