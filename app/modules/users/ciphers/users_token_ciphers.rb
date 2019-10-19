module UsersTokenCiphers
  private

  def generate_token
    @token = SecureRandom.hex(64)
    @user.token_date = Date.today if @user
    encrypt_token
  end

  def encrypt_token
    @record = @token
    @key = Rails.application.secrets.token_key
    @iv = Rails.application.secrets.token_iv
    @salt = Rails.application.secrets.token_salt
    @encrypted_token = encrypt_with_fixed_iv_and_salt
  end

  def decrypt_token
    @encrypted_record = @user.encrypted_token
    @key = Rails.application.secrets.token_key
    @iv = Rails.application.secrets.token_iv
    decrypt
  end

  def find_user_with_token
    encrypt_token
    @user = User.find_by(encrypted_token: @encrypted_token)
    return false unless @user

    @user_cipher = UserCipher.find(@user.id)
  end
end
