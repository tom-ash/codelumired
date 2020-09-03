module UsersDestroy
  SUBJECT = {
    'pl' => 'Usuwanie konta',
    'en' => 'Account Deletion'
  }

  def destroy_send_email
    return bad_request unless user_validated?

    @language = request.headers[:language]
    @email_sender = 'warsawlease.pl <noreply@warsawlease.pl>'
    @email_recipient = params[:email]
    @email_subject = @context = SUBJECT[@language]

    send_verification
  end

  def destroy
    return bad_request unless user_validated?
    return bad_request if verification_code_invalid?

    @deleted_user = DeletedUser.find_by(id: @user.id) || DeletedUser.create(id: @user.id, original_user: {})
    return ok if @deleted_user.update_attributes(original_user: @user) && @user.destroy

    unprocessable_entity
  end
end
