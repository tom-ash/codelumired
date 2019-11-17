module UsersEditBusinessName
  def edit_business_name
    @required_params = [:business_name]
    return bad_request unless user_validated? && required_params_present?

    @business_name = params[:business_name]
    @user.showcase[:business_name] = @business_name
    @user.business_name = @business_name
    return ok if @user.save

    bad_request
  end
end
