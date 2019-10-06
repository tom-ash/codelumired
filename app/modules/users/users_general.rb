module UsersGeneral
  def get_derived_salt
    @email = request.headers['emailAddress']
    render_something_went_wrong and return unless @email
    email_encryption_object = encrypt_email
    derived_cipher = DerivedCipher.find_by(id: email_encryption_object[1])
    @response = { recordSalt: derived_cipher.salt }
    render_200 and return if derived_cipher
    render_something_went_wrong
  end

  private

  def find_user_with_email
    @email = request.headers[:emailAddress]
    encrypt_email
    @user = User.find_by(encrypted_email: @encrypted_email)
  end

  def find_user_and_cipher_with_email
    @email = request.headers[:emailAddress] || params[:emailAddress] ||
             request.headers[:email] || params[:email]
    return unless @email

    encrypt_email
    @user = User.find_by(encrypted_email: @encrypted_email)
    return unless @user

    @user_cipher = UserCipher.find_by(id: @user.id)
  end

  def send_verification
    find_user_and_cipher_with_email
    return render_200 unless @user && @user_cipher

    generate_verification
    prepare_email_content
    send_email
    return render_200 if update_user && update_user_cipher

    render_400
  end

  def prepare_email_content
    @email_text = @verification_code
    @email_html = verification_email
  end

  def update_user
    @user.update_attributes(verification: @verification)
  end

  def update_user_cipher
    @user_cipher.update_attributes(verification_code_iv: @verification_code_iv)
  end

  def verification_code_valid
    @verification_code_from_client == @verification_code_from_database
  end

  def verification_code_invalid?
    decrypt_verification_code
    @verification_code != request.headers[:verificationCode] &&
    @verification_code != params[:verificationCode] &&
    @verification_code != params[:verification_code]
  end
end
