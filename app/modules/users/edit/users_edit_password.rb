module UsersEditPassword
  def edit_password_send_email
    @language = params[:language]
    @required_params = [:email]
    return bad_request unless required_params_present?

    @email_sender = 'warsawlease.pl <noreply@warsawlease.pl>'
    @email_recipient = params[:email]
    @email_subject = @context = @language == 'polish' ? 'Kod weryfikacyjny' : 'Verification Code'
    send_verification
  end

  def edit_password_send_verification
    @required_params = %i[email verification_code]
    return bad_request unless required_params_present?

    find_user_with_email
    return bad_request if verification_code_invalid?

    ok
  end

  def edit_password
    @required_params = %i[email verification_code password]
    return bad_request unless required_params_present?

    find_user_with_email
    return bad_request if verification_code_invalid?

    @password = params[:password]
    hash_user_password
    return ok if user_saved

    bad_request
  end

  private

  def user_saved
    @user.update_attributes(hashed_password: @hashed_password, password_salt: @password_salt)
  end
end
