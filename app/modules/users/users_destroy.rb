module UsersDestroy
  def destroy_send_email
    return render_bad_request unless user_validated?

    @email_sender = 'warsawlease.pl <noreply@warsawlease.pl>'
    @email_recipient = params[:email]
    @email_subject = @context = 'Account Deletion Verification Code'
    send_verification
  end

  def destroy
    return render_bad_request unless user_validated?

    return render_bad_request if verification_code_invalid?

    @deleted_user = DeletedUser.find_by(id: @user.id) || DeletedUser.create(id: @user.id, original_user: {})
    @deleted_user_cipher = DeletedUserCipher.find_by(id: @user.id) || DeletedUserCipher.create(id: @user.id, original_user_cipher: {})
    @deleted_user.update_attributes(original_user: @user)
    @deleted_user_cipher.update_attributes(original_user_cipher: @user_cipher)
    @user.announcements.destroy_all
    @user.destroy
    @user_cipher.destroy
    render_ok
  end
end
