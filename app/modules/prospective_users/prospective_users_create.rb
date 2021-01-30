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
    @account_type = params[:account_type]
    @private_account = @account_type == 'private'
    @lang = request.headers[:lang]
    @email = params[:email].downcase
    @subject = @lang == 'pl' ? 'Rejestracja konta' : 'Account Registration'
    @first_name = params[:first_name]
    @password = params[:password]
    @business_name = params[:business_name]
    @phone_code = params[:phone_code]
    @phone_body = params[:phone]
    terms_and_privacy_consent_attrs = params[:terms_and_privacy_consent]
    @consents = [{
      granted: terms_and_privacy_consent_attrs[:value] == 'granted',
      displayed_text: terms_and_privacy_consent_attrs[:text],
      expressed_at: Time.zone.now
    }]
  end

  def invalid_params?
    params_to_validate = [@phone_code, @phone_body, @email, @password, @consents]
    params_to_validate.concat(@account_type == 'private' ? [@first_name] : [@business_name])
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
    generate_verification
    @prospective_user.verification = @verification
    @prospective_user.verification_code_iv = @verification_code_iv
  end

  def prepare_user
    hash_user_password
    @user_object = {
      account_type: @account_type,
      email: @email,
      hashed_password: @hashed_password,
      password_salt: @password_salt,
      phone: { code: @phone_code, body: @phone_body, verified: false },
      consents: @consents
    }.merge(account_type_specific_attributes)
    @prospective_user.user = @user_object
  end

  def account_type_specific_attributes
    return { first_name: @first_name } if @private_account

    { business_name: @business_name }
  end

  def send_verification
    TransactionalMailer.verification_email(
      to: @email,
      subject: @subject,
      verification_code: @verification_code,
      lang: @lang
    ).deliver_now
  end

  def account_prepared
    @prospective_user.save
  end
end
