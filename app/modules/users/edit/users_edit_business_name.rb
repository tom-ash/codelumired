module UsersEditBusinessName
  def edit_business_name
    @required_params = [:business_name]
    render_bad_request and return unless user_validated? && required_params_present?
    @business_name = params[:business_name]
    encrypt_business_name
    @user.showcase[:business_name] = @business_name
    render_ok and return if @user.update_attributes(encrypted_business_name: @encrypted_business_name) &&
                             @user_cipher.update_attributes(business_name_iv: @business_name_iv)
    render_bad_request
  end
end
