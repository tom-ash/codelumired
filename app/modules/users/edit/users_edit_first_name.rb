module UsersEditFirstName
  def edit_first_name
    @required_params = [:first_name]
    return bad_request unless required_params_present? && user_validated?

    @first_name = params[:first_name]
    @user.showcase[:name] = @first_name
    @user.first_name = @first_name
    return bad_request unless @user.save

    ok
  end
end
