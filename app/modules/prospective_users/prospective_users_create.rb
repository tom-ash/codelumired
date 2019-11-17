module ProspectiveUsersCreate
  def create
    parse_params
    return bad_request if invalid_params?

    generate_access_token
    @response = { token: @access_token }
    return created if user_exists

    create_prospective_user
    prepare_verification
    prepare_user
    send_verification if account_prepared
    created
  end

  private

  def parse_params
    @language = request.headers[:language]
    @email = params[:email]
    @password = params[:password]
    @business_name = params[:business_name]
    @phone_code = params[:phone_code]
    @phone_body = params[:phone]
    @consents = [params[:terms], params[:privacy]]
  end

  def invalid_params?
    params_to_validate = [@business_name, @phone_code, @phone_body, @email, @password, @consents]
    params_to_validate.each { |param| return true if param.blank? }

    false
  end

  def user_exists
    @user = User.find_by(email: @email)
  end

  def create_prospective_user
    @prospective_user = ProspectiveUser.new(
      encrypted_access_token: @encrypted_access_token,
      verification: {},
      user: {}
    )
  end

  def prepare_verification
    @context = @language == 'polish' ? 'Kod weryfikacyjny' : 'Verification Code'
    generate_verification
    @prospective_user.verification = @verification
    @prospective_user.verification_code_iv = @verification_code_iv
  end

  def prepare_user
    hash_user_password
    @user_object = {
      email: @email,
      hashed_password: @hashed_password,
      password_salt: @password_salt,
      business_name: @business_name,
      phone: { code: @phone_code, body: @phone_body, verified: false },
      consents: @consents
    }
    @prospective_user.user = @user_object
  end

  def send_verification
    @email_sender = 'warsawlease.pl <noreply@warsawlease.pl>'
    @email_recipient = @email
    @email_subject = @context
    @email_text = @verification_code
    @email_html = verification_email
    send_email
  end

  def account_prepared
    @prospective_user.save
  end
end
