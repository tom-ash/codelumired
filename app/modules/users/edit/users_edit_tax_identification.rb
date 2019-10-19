module UsersEditTaxIdentification
  def edit_tax_identification
    @required_params = [:tax_identification]
    render_bad_request and return unless user_validated? && required_params_present?
    @tax_identification = params[:tax_identification]
    encrypt_tax_identification
    render_ok and return if @user.update_attributes(encrypted_tax_identification: @encrypted_tax_identification) &&
                             @user_cipher.update_attributes(tax_identification_iv: @tax_identification_iv)
    render_bad_request
  end
end