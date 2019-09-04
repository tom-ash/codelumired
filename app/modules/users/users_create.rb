SOMETHING_WENT_WRONG = { error: 'Something Went Wrong' }
module UsersCreate
  def create_with_email
    parse_params
    return render_something_went_wrong unless @prospective_user && @prospective_user_cipher

    decrypt_verification_code_for_prospective_user
    return render_something_went_wrong unless verification_code_valid

    prepare_user_object
    prepare_user_cipher
    generate_search_token
    generate_access_token
    extend_user_object
    extend_user_cipher
    prepare_showcase
    create_user_and_user_cipher
    update_user_status
    decrypt_business_name
    name = @business_name
    @response = { UST: @search_token, UAT: @access_token, name: name }
    return render_201 if @user.status == 1

    render_something_went_wrong
  end

  private

  def parse_params
    @search_token = request.headers[:searchToken]
    find_prospective_user_with_search_token if @search_token
    return unless @prospective_user

    @prospective_user_cipher = ProspectiveUserCipher.find_by id: @prospective_user.id
    @verification_code_from_client = params[:verificationCode]
    @verification_code_from_database = decrypt_verification_code_for_prospective_user
  end

  def prepare_user_object
    @user_object = @prospective_user.user.merge!(
      status: 0,
      tokens_date: Date.today,
      verification: {},
      points: 0,
      encrypted_tax_identification: '',
      encrypted_legal_name: '',
      encrypted_address: '',
      history: []
    ).with_indifferent_access
  end

  def prepare_user_cipher
    @user_cipher_object = @prospective_user_cipher.user_cipher.merge!(
      verification_code_iv: '',
      tax_identification_iv: '',
      legal_name_iv: '',
      address_iv: '',
      history: []
    ).with_indifferent_access
  end

  def extend_user_object
    @user_object.merge!(
      encrypted_search_token: @encrypted_search_token,
      hashed_access_token: @hashed_access_token
    )
  end

  def extend_user_cipher
    @user_cipher_object.merge!(access_token_salt: @access_token_salt)
  end

  def prepare_showcase
    @showcase = {
      businessName: decrypt_business_name_from_prospective_user,
      phone: decrypt_phone_body_from_prospective_user[0..2]
    }
    @user_object.merge!(showcase: @showcase)
  end

  def create_user_and_user_cipher
    @user = User.create(@user_object)
    return unless @user

    @user_cipher_object.merge!(id: @user.id)

    @user_cipher = UserCipher.find_by_id(@user.id)
    return @user_cipher.update(@user_cipher_object) if @user_cipher

    @user_cipher = UserCipher.create(@user_cipher_object)
  end

  def update_user_status
    @user.status = 1 if @user && @user_cipher
  end
end
