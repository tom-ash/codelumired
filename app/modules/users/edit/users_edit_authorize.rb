module UsersEditAuthorize
  def authorize_with_email_and_password
    find_user_and_cipher_with_email
    render_something_went_wrong and return unless @user && @user_cipher
    render_something_went_wrong and return unless user_password_valid?
    generate_tokens
    decrypt_business_name
    phone_verified?
    @response = { UST: @search_token, UAT: @access_token, name: @business_name, phone_verified: @phone_verified }
    render_200 and return if tokens_updated
    @response = {}
    render_400
  end

  def authorize_with_tokens
    render_something_went_wrong and return unless user_validated?
    phone_verified?
    decrypt_business_name
    @response = { name: @business_name, phone_verified: @phone_verified }
    render_200
  end

  protected

  def user_validated?
    @search_token = request.headers[:UST]
    @access_token = request.headers[:UAT]
    return false unless @search_token && @access_token
    find_user_with_search_token && validate_access_token
  end

  def tokens_updated
    @user.update_attributes({ encrypted_search_token: @encrypted_search_token,
                              hashed_access_token: @hashed_access_token }) &&
    @user_cipher.update_attributes(access_token_salt: @access_token_salt)
  end

  def phone_verified?
    @phone_verified = @user.phone['verified']
  end
end