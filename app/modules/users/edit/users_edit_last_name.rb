module UsersEditLastName
  def edit_last_name
    @required_params = [:last_name]
    return bad_request unless required_params_present? && user_validated?

    @user.last_name = params[:last_name]
    return ok if @user.save

    bad_request
  end
end
