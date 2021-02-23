module UsersAuthorize
  def authorize_with_email
    find_user_with_email
    return bad_request unless @user
    return bad_request unless user_password_valid?

    # FIX!!!
    token_current? ? current_access_token : generate_access_token
    phone_verified?
    @response = {
      access_token: @access_token,
      account_type: @user.account_type,
      name: name,
      phone_verified: @phone_verified
    }
    return ok if token_current? || token_updated?

    @response = {}
    bad_request
  end

  protected

  def name
    @user.private_account? ? @user.first_name : @user.business_name
  end

  def current_access_token
    @access_token = decrypt_access_token
  end

  def token_current?
    @user.access_token_date > 1.year.ago
  end

  def user_validated?
    @access_token = request.headers['Access-Token']
    return false unless @access_token

    find_user_with_token
  end

  def token_updated?
    @user.update(:encrypted_access_token, @encrypted_access_token)
  end
end
