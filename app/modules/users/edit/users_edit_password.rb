module UsersEditPassword
  def edit_password_send_email
    @language = params[:language]
    @required_params = [:email]
    return render_bad_request unless required_params_present?

    @email_sender = 'warsawlease.pl <noreply@warsawlease.pl>'
    @email_recipient = params[:email]
    @email_subject = @context = @language == 'polish' ? 'Kod weryfikacyjny' : 'Verification Code'
    send_verification
  end

  def edit_password_send_verification
    @required_params = %i[email verification_code]
    return render_bad_request unless required_params_present?

    find_user_and_cipher_with_email
    return render_bad_request if verification_code_invalid?

    render_ok
  end

  def edit_password
    @required_params = %i[email verification_code password]
    return render_bad_request unless required_params_present?

    find_user_and_cipher_with_email
    return render_bad_request if verification_code_invalid?

    @password = params[:password]
    hash_user_password
    return render_ok if user_and_cipher_saved

    render_bad_request
  end

  private

  def user_and_cipher_saved
    @user.update_attributes(hashed_password: @hashed_password) &&
      @user_cipher.update_attributes(password_salt: @password_salt)
  end
end