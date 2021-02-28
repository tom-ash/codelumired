module UsersEditPhone
  def verify_phone
    return bad_request unless user_validated?
    return bad_request if verification_code_invalid?

    @user.phone[:verified] = true
    return ok if @user.save

    bad_request
  end

  def edit_phone
    @required_params = %i[phone_code body]
    return bad_request unless user_validated? && required_params_present?

    @phone_code = params[:phone_code]
    @phone_body = params[:body]
    return bad_request if @phone_body.length != 9

    @phone = { code: @phone_code, body: @phone_body, verified: false }
    @user.showcase[:phone] = "#{@phone_code} #{@phone_body[0..2]}"
    return ok if @user.update!(phone: @phone)

    bad_request
  end
end