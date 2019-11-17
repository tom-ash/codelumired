module UsersPasswordCiphers
  private

  def hash_user_password
    @password ||= request.headers[:password] || params[:password]
    @password_salt = SecureRandom.hex(32)
    @hashed_password = BCrypt::Password.create(extended_password, cost: 12)
  end

  def user_password_valid?
    @password ||= request.headers[:password] || params[:password]
    @password_salt = @user.password_salt
    BCrypt::Password.new(@user.hashed_password) == extended_password
  end

  def extended_password
    Digest::SHA512.new.base64digest(@password + @password_salt + Rails.application.secrets.password_salt)
  end
end
