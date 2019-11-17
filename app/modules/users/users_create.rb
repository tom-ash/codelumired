SOMETHING_WENT_WRONG = { error: 'Something Went Wrong' }
module UsersCreate
  def create_with_email
    parse_params
    return bad_request unless @prospective_user && verification_code_valid

    prepare_user_object
    generate_access_token
    extend_user_object
    create_user
    @response = { access_token: @access_token, name: @user.business_name }
    return created if @user.status == 1

    bad_request
  end

  private

  def parse_params
    @access_token = request.headers['Access-Token']
    find_prospective_user_with_token if @access_token
    @verification_code_from_client = params[:verification_code]
    @verification_code_from_database = decrypt_verification_code_for_prospective_user
  end

  def prepare_user_object
    phone = @prospective_user.user['phone']
    @user_object = @prospective_user.user.merge!(
      status: 1, access_token_date: Date.today, verification: {}, verification_code_iv: '', points: 0,
      showcase: { business_name: @prospective_user.user['business_name'],
                  phone: "#{phone['code']} #{phone['body'][0..2]}" },
      legal_name: '',
      tax_number: '',
      address: '',
      changes_log: []
    ).with_indifferent_access
  end

  def extend_user_object
    @user_object.merge!(encrypted_access_token: @encrypted_access_token)
  end

  def create_user
    @user = User.create(@user_object)
  end
end
