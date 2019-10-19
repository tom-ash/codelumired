module UsersAuthorize
  def authorize_with_email
    find_user_and_cipher_with_email
    return render_something_went_wrong unless @user && @user_cipher

    return render_something_went_wrong unless user_password_valid?

    token_current? ? find_token : generate_token
    decrypt_business_name
    phone_verified?
    @response = {
      UT: @token,
      name: @business_name,
      phone_verified: @phone_verified
    }
    return render_200 if token_current? || token_updated?

    @response = {}
    render_400
  end

  def authorize_with_token
    return render_something_went_wrong unless user_validated?

    phone_verified?
    decrypt_business_name
    @response = { name: @business_name, phone_verified: @phone_verified }
    render_200
  end

  protected

  def find_token
    @token = decrypt_token
  end

  def token_current?
    @user.token_date > 1.year.ago
  end

  def user_validated?
    @token = request.headers[:UT]
    return false unless @token

    find_user_with_token
  end

  def token_updated?
    @user.update_attribute(:encrypted_token, @encrypted_token)
  end
end
