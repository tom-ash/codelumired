module UsersEditPassword
  def edit_password_send_email
    @lang = params[:lang]
    @required_params = [:email]
    return bad_request unless required_params_present?

    @email = params[:email]
    @subject = @lang == 'pl' ? 'Zmiana hasła' : 'Password Change'
    handle_verification
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
