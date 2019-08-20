module ProspectiveUsersCreate
  def create
    parse_params
    render_something_went_wrong and return if invalid_params
    encrypt_email
    generate_prospective_user_search_token
    @response = { token: @search_token }
    render_201 and return if user_exists
    create_prospective_user
    create_prospective_user_cipher
    prepare_verification
    prepare_user
    prepare_user_cipher
    send_verification_code if account_prepared
    render_201
  end

  private

  def parse_params
    @language = request.headers[:language]
    @business_name = params[:businessName]
    # @tax_identification = params[:taxIdentification]
    @phone_code = params[:countryCode]
    @phone_body = params[:phone]
    @email = params[:email]
    @password = params[:password]
    @consents = [params[:terms], params[:privacy]]
  end
  
  def invalid_params
    params_to_validate = [ @business_name,
    # @tax_identification,
    @phone_code, @phone_body, @email, @password ]
    for param in params_to_validate
      return true if param == '' || param == nil
    end
    return false
  end

  def user_exists
    @user = User.find_by encrypted_email: @encrypted_email
  end

  def create_prospective_user
    @prospective_user = ProspectiveUser.create
    @prospective_user.encrypted_search_token = @encrypted_search_token
  end

  def create_prospective_user_cipher
    ProspectiveUserCipher.create
    @prospective_user_cipher = ProspectiveUserCipher.find_by id: @prospective_user.id
    @prospective_user_cipher ||= ProspectiveUserCipher.create(id: @prospective_user.id)
  end

  def prepare_verification
    @context = 'Account Registration Verification Code'
    generate_verification
    @prospective_user.verification = @verification
    @prospective_user_cipher.verification_code_iv = @verification_code_iv
  end

  def prepare_user
    encrypt_business_name
    # encrypt_tax_identification
    encrypt_phone_body
    hash_user_password
    @user_object = { consents: @consents, encrypted_business_name: @encrypted_business_name,
                    #  encrypted_tax_identification: @encrypted_tax_identification,
                     phone: { phone_code: @phone_code, encrypted_body: @encrypted_phone_body,
                              verified: false }, encrypted_email: @encrypted_email, hashed_password: @hashed_password }
    @prospective_user.user = @user_object
  end

  def prepare_user_cipher
    @user_cipher_object = { business_name_iv: @business_name_iv,
                            # tax_identification_iv: @tax_identification_iv,
                            phone_body_iv: @phone_body_iv, email_derived_cipher_id: @email_derived_cipher_id,
                            password_salt: @password_salt }
    @prospective_user_cipher.user_cipher = @user_cipher_object
  end

  def send_verification_code
    @email_sender = 'warsawlease.com <noreply@warsawlease.com>'
    @email_recipient = @email
    @email_subject = @context
    @email_text = @verification_code
    @email_html = @verification_code
    send_email
  end

  def account_prepared
    @prospective_user.save && @prospective_user_cipher.save
  end
end