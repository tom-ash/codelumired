module UsersEditPhone
  def verify_phone
    render_400 and return unless user_validated?
    render_400 and return if verification_code_invalid?
    @user.phone[:verified] = true
    @user.save
    render_200
  end

  def edit_phone
    @required_params = [:country_code, :body]
    render_400 and return unless user_validated? && required_params_present?
    @phone_body = params[:body]
    render_400 and return if @phone_body.length != 9
    encrypt_phone_body
    @phone = { phone_code: params[:country_code], encrypted_body: @encrypted_phone_body,
               verified: false }
    render_200 and return if @user.update_attributes(phone: @phone) &&
                             @user_cipher.update_attributes(phone_body_iv: @phone_body_iv)
    render_400
  end
end