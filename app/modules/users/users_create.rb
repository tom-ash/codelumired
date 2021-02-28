module UsersCreate
  def create_with_email
    parse_params
    return bad_request unless @prospective_user && verification_code_valid

    prepare_user_object
    generate_access_token
    extend_user_object
    create_user
    @response = {
      access_token: @access_token,
      name: @private_account ? @user.first_name : @user.business_name
    }
    return created if @user.reload.status == 1

    bad_request
  end

  private

  def parse_params
    @access_token = request.headers['Access-Token']
    find_prospective_user_with_token if @access_token
    @verification_code_from_client = params[:verification_code]
    @verification_code_from_database = decrypt_verification_code_for_prospective_user
    @private_account = @prospective_user.user['account_type'] == 'private'
  end

  def prepare_user_object
    @user_object = @prospective_user.user.merge!(
      status: 1,
      access_token_date: Date.today,
      points: 0,
      showcase: showcase,
      change_log: []
    )
  end

  def showcase
    phone = @prospective_user.user['phone']
    {
      name: @private_account ? @prospective_user.user['first_name'] : @prospective_user.user['business_name'],
      phone: "#{phone['code']} #{phone['body'][0..2]}"
    }
  end

  def extend_user_object
    @user_object.merge!(encrypted_access_token: @encrypted_access_token)
  end

  def create_user
    @user = site::User.create(@user_object)
  end
end
