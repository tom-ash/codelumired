module UsersVerify
  private

  def send_verification
    find_user_and_cipher_with_email
    return render_200 unless @user && @user_cipher

    generate_verification
    prepare_email_verification
    send_email
    return render_200 if update_user_verification && update_user_cipher_verification_iv

    render_400
  end

  def prepare_email_verification
    @email_text = @verification_code
    @email_html = verification_email
  end

  def update_user_verification
    @user.update_attributes(verification: @verification)
  end

  def update_user_cipher_verification_iv
    @user_cipher.update_attributes(verification_code_iv: @verification_code_iv)
  end

  def verification_code_valid
    raise ArgumentError unless @verification_code_from_client.length == 8 &&
                               @verification_code_from_database.length == 8

    @verification_code_from_client == @verification_code_from_database
  end

  def verification_code_invalid?
    decrypt_verification_code
    raise ArgumentError unless @verification_code.length >= 8

    @verification_code != request.headers[:verificationCode] &&
      @verification_code != params[:verificationCode] &&
      @verification_code != params[:verification_code]
  end

  def phone_verified?
    @user.phone['verified']
  end
end
