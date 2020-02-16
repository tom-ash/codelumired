module UsersEditEmail
  def edit_email_send_current

    @language = request.headers[:language]
    @required_params = [:email]
    return bad_request unless user_validated? && required_params_present?

    @email_sender = 'warsawlease.pl <noreply@warsawlease.pl>'
    @email_recipient = params[:email]
    @email_subject = @context = @language == 'polish' ? 'Kod weryfikacyjny' : 'Verification Code'
    send_verification
  end

  def edit_email_verify_current
    @required_params = [:verification_code]
    return bad_request unless user_validated? && required_params_present?
    return bad_request if verification_code_invalid?

    ok
  end

  def edit_email_send_new
    @language = request.headers[:language]
    @required_params = [:new_email]
    return bad_request unless user_validated? && required_params_present?

    @email_sender = 'warsawlease.pl <noreply@warsawlease.pl>'
    @email_recipient = @email = params[:new_email].downcase
    @email_subject = @context = @language == 'polish' ? 'Kod weryfikacyjny' : 'Verification Code'
    @new_email_verification_code = rand(10_000).to_s
    @email_text = @new_email_verification_code
    @email_html = verification_email
    send_email
    @verification_code = decrypt_verification_code + @new_email_verification_code
    generate_verification
    @verification['new_email'] = params[:new_email].downcase
    @user.verification = @verification
    @user.verification_code_iv = @verification_code_iv
    return ok if @user.save

    bad_request
  end

  def edit_email_verify_new
    @required_params = [:verification_code]
    return bad_request unless user_validated? && required_params_present?
    return bad_request if verification_code_invalid?

    render 200
  end

  def edit_email
    @required_params = [:verification_code, :old_password, :new_password]
    return bad_request unless user_validated? && required_params_present?
    return bad_request if verification_code_invalid?

    @password = params[:old_password]
    return bad_request unless user_password_valid?

    @password = params[:new_password]
    hash_user_password
    @user.email = @user.verification['new_email']
    @user.hashed_password = @hashed_password
    @user.password_salt = @password_salt
    return ok if @user.save

    bad_request
  end
end
