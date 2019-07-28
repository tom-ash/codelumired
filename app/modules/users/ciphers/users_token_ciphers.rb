module UsersTokenCiphers

  private

  def generate_tokens
    generate_search_token
    generate_access_token
  end

  def generate_search_token
    @search_token = SecureRandom.hex(32)
    encrypt_search_token
  end

  def generate_access_token
    @access_token = SecureRandom.hex(32)
    @access_token_salt = SecureRandom.hex(16)
    @hashed_access_token = hash_access_token
  end

  def encrypt_search_token
    @record = @search_token
    @key = Rails.application.secrets.search_token_key
    @iv = Rails.application.secrets.search_token_iv
    @salt = Rails.application.secrets.search_token_salt
    @encrypted_search_token = encrypt_with_fixed_iv_and_salt
  end

  def find_user_with_search_token
    encrypt_search_token
    @user = User.find_by(encrypted_search_token: @encrypted_search_token)
    return false unless @user
    @user_cipher = UserCipher.find(@user.id)
  end

  def validate_access_token
    @salt = @user_cipher.access_token_salt
    BCrypt::Password.new(@user.hashed_access_token) == extended_access_token
  end

  def hash_access_token
    @salt = @access_token_salt
    BCrypt::Password.create(extended_access_token, cost: 8)
  end

  def extended_access_token
    (Digest::SHA512.new).base64digest(@access_token + @salt + Rails.application.secrets.access_token_salt)
  end
end
