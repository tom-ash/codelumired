module UsersEditEmail
  def edit_email_send_current

    @lang = request.headers[:lang]
    @required_params = [:email]
    return bad_request unless user_validated? && required_params_present?

    @email = params[:email]
    @subject = @context = @lang == 'pl' ? 'Zmiana adresu email #1' : 'Email Address Change #1'
    handle_verification
  end

  def edit_email_verify_current
    @required_params = [:verification_code]
    return bad_request unless user_validated? && required_params_present?
    return bad_request if verification_code_invalid?

    ok
  end

  def edit_email_send_new
    @lang = request.headers[:lang]
    @required_params = [:new_email]
    return bad_request unless user_validated? && required_params_present?

    @email = @email = params[:new_email].downcase
    @subject = @lang == 'pl' ? 'Zmiana adresu email #2' : 'Email Address Change #2'
    @verification_code = @new_verification_code = rand(1000..9999).to_s
    send_verification
    @verification_code = decrypt_verification_code + @new_verification_code 
    generate_verification
    @verification['new_email'] = @email.downcase
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
