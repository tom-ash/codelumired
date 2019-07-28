module UsersEditPassword
  def edit_password_send_email
    @required_params = [:email]
    render_400 and return unless required_params_present?
    @email_sender = 'warsawlease.com <noreply@warsawlease.com>'
    @email_recipient = params[:email]
    @email_subject = @context = 'Password Change Verification Code'
    send_verification_code
  end

  def edit_password_send_verification
    @required_params = [:email, :verification_code]
    render_400 and return unless required_params_present?
    find_user_and_cipher_with_email
    render_400 and return if verification_code_invalid?
    render_200
  end

  def edit_password
    @required_params = [:email, :verification_code, :password]
    render_400 and return unless required_params_present?
    find_user_and_cipher_with_email
    render_400 and return if verification_code_invalid?
    @password = params[:password]
    hash_user_password
    render_200 and return if user_and_cipher_saved
    render_400
  end

  private

  def user_and_cipher_saved
    @user.update_attributes(hashed_password: @hashed_password) &&
    @user_cipher.update_attributes(password_salt: @password_salt)
  end
end