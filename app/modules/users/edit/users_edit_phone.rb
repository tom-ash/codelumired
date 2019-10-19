module UsersEditPhone
  def verify_phone
    render_bad_request and return unless user_validated?
    render_bad_request and return if verification_code_invalid?
    @user.phone[:verified] = true
    @user.save
    render_ok
  end

  def edit_phone
    @required_params = [:country_code, :body]
    render_bad_request and return unless user_validated? && required_params_present?
    @country_code = params[:country_code]
    @phone_body = params[:body]
    render_bad_request and return if @phone_body.length != 9
    encrypt_phone_body
    @phone = { phone_code: @country_code, encrypted_body: @encrypted_phone_body,
               verified: false }
    @user.showcase[:phone] = "#{@country_code} #{@phone_body[0..2]}"
    render_ok and return if @user.update_attributes(phone: @phone) &&
                             @user_cipher.update_attributes(phone_body_iv: @phone_body_iv)
    render_bad_request
  end
end