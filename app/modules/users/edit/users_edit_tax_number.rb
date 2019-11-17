module UsersEditTaxNumber
  def edit_tax_number
    @required_params = %i[tax_number]
    return bad_request unless user_validated? && required_params_present?

    @tax_number = params[:tax_number]
    return ok if @user.update_attributes(tax_number: @tax_number)

    bad_request
  end
end
