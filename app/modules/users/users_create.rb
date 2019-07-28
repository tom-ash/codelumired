SOMETHING_WENT_WRONG = { error: 'Something Went Wrong' }

module UsersCreate  
  def create_with_email
    parse_params
    render_something_went_wrong and return unless @prospective_user && @prospective_user_cipher
    decrypt_verification_code_for_prospective_user
    render_something_went_wrong and return unless verification_code_valid
    prepare_user_object
    prepare_user_cipher
    generate_search_token
    generate_access_token
    extend_user_object
    extend_user_cipher
    prepare_showcase
    save_user_and_user_cipher
    decrypt_business_name
    name = @business_name
    @response = { UST: @search_token, UAT: @access_token, name: name }
    render_201 and return if @user_and_user_cipher_saved
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
    @points = 0
  end

  def prepare_user_object
    @user_object = @prospective_user.user.with_indifferent_access
  end

  def prepare_user_cipher
    @user_cipher_object = @prospective_user_cipher.user_cipher.with_indifferent_access
  end

  def extend_user_object
    @user_object.merge!({ encrypted_search_token: @encrypted_search_token, hashed_access_token: @hashed_access_token,
                          points: @points })
  end

  def extend_user_cipher
    @user_cipher_object.merge!({ access_token_salt: @access_token_salt })
  end

  def prepare_showcase
    @showcase = { businessName: decrypt_business_name_from_prospective_user,
                  phone: decrypt_phone_body_from_prospective_user[0..2] }
    @user_object.merge!({ showcase: @showcase })
  end

  def save_user_and_user_cipher
    @user = User.create(status: 'registration initiated')
    @user_cipher = UserCipher.find_by(id: @user.id) || UserCipher.create(id: @user.id)
    @user_and_user_cipher_saved = @user_cipher.update(@user_cipher_object) && @user.update(@user_object)
    @user.update(status: 'ok') if @user_and_user_cipher_saved
  end
end

