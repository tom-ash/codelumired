module UsersDestroy
  SUBJECT = {
    'pl' => 'Usuwanie konta',
    'en' => 'Account Deletion'
  }

  def destroy_send_email
    return bad_request unless user_validated?

    @lang = request.headers[:lang]
    @email = params[:email]
    @subject = SUBJECT[@lang]

    handle_verification
  end

  def destroy
    return bad_request unless user_validated?
    return bad_request if verification_code_invalid?

    @deleted_user = site::DeletedUser.find_by(id: @user.id) || site::DeletedUser.create(id: @user.id, original_user: {})

    return ok if @deleted_user.update!(original_user: @user) && @user.destroy

    unprocessable_entity
  end
end
