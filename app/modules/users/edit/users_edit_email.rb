module UsersEditEmail
  def edit_email_send_current
    @language = request.headers[:language]
    @required_params = [:email]
    render_bad_request and return unless user_validated? && required_params_present?
    @email_sender = 'warsawlease.pl <noreply@warsawlease.pl>'
    @email_recipient = params[:email]
    @email_subject = @context = @language == 'polish' ? 'Kod weryfikacyjny' : 'Verification Code'
    send_verification
  end

  def edit_email_verify_current
    @required_params = [:verification_code]
    render_bad_request and return unless user_validated? && required_params_present?
    render_bad_request and return if verification_code_invalid?
    render_ok
  end

  def edit_email_send_new
    @language = request.headers[:language]
    @required_params = [:new_email]
    render_bad_request and return unless user_validated? && required_params_present?
    @email_sender = 'warsawlease.pl <noreply@warsawlease.pl>'
    @email_recipient = @email = params[:new_email]
    @email_subject = @context = @language == 'polish' ? 'Kod weryfikacyjny' : 'Verification Code'
    @new_email_verification_code = SecureRandom.hex(4).upcase
    @email_text = @new_email_verification_code
    @email_html = verification_email
    send_email
    @verification_code = decrypt_verification_code + @new_email_verification_code
    generate_verification
    encrypt_email
    @verification['newEncryptedEmail'] = @encrypted_email
    @verification['newEmailDerivedCipherId'] = @email_derived_cipher_id
    render_ok and return if @user.update_attributes(verification: @verification) &&
                             @user_cipher.update_attributes(verification_code_iv: @verification_code_iv)
    render_bad_request
  end

  def edit_email_verify_new
    @required_params = [:verification_code]
    render_bad_request and return unless user_validated? && required_params_present?
    render_bad_request and return if verification_code_invalid?
    render 200
  end

  def edit_email
    @required_params = [:verification_code, :old_password, :new_password]
    render_bad_request and return unless user_validated? && required_params_present?
    render_bad_request and return unless user_validated?
    render_bad_request and return if verification_code_invalid?
    @password = params[:old_password]
    render_bad_request and return unless user_password_valid?
    @password = params[:new_password]
    hash_user_password
    render_ok and return if @user.update_attributes({
                               encrypted_email: @user.verification['newEncryptedEmail'],
                               hashed_password: @hashed_password
                             }) &&
                             @user_cipher.update_attributes({
                               email_derived_cipher_id: @user.verification['newEmailDerivedCipherId'],
                               password_salt: @password_salt
                             })
    render_bad_request
  end
end