module UsersVerify
  private

  def send_verification
    find_user_with_email
    return ok unless @user

    generate_verification
    prepare_email_verification
    send_email
    return ok if update_user_verification

    bad_request
  end

  def prepare_email_verification
    @email_text = @verification_code
    @email_html = verification_email
  end

  def update_user_verification
    @user.update(verification: @verification, verification_code_iv: @verification_code_iv)
  end

  def verification_code_valid
    raise ArgumentError unless @verification_code_from_client.length == 4 &&
                               @verification_code_from_database.length == 4

    @verification_code_from_client == @verification_code_from_database
  end

  def verification_code_invalid?
    decrypt_verification_code
    raise ArgumentError unless @verification_code.length >= 4

    @verification_code != request.headers[:verification_code] &&
      @verification_code != params[:verification_code] &&
      @verification_code != params[:verification_code]
  end

  def phone_verified?
    @phone_verified = @user.phone['verified']
  end
end
