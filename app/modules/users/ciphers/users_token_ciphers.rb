module UsersTokenCiphers
  private

  def generate_access_token
    @access_token = SecureRandom.hex(64)
    @user.access_token_date = Date.today if @user
    encrypt_access_token
  end

  def encrypt_access_token
    @record = @access_token
    @key = Rails.application.secrets.access_token_key
    @iv = Rails.application.secrets.access_token_iv
    @salt = Rails.application.secrets.access_token_salt
    @encrypted_access_token = encrypt_with_fixed_iv_and_salt
  end

  def decrypt_access_token
    @encrypted_record = @user.encrypted_access_token
    @key = Rails.application.secrets.access_token_key
    @iv = Rails.application.secrets.access_token_iv
    decrypt
  end

  def find_user_with_token
    encrypt_access_token
    @user = site::User.find_by(encrypted_access_token: @encrypted_access_token)
  end
end
