module UsersGeneral
  private

  def find_user_with_email
    @email = request.headers[:emailAddress] ||
             params[:emailAddress] ||
             request.headers[:email] ||
             params[:email]
    @user = User.find_by(email: @email)
  end
end
