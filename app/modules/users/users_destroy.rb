module UsersDestroy
  def destroy_send_email
    render_400 and return unless user_validated?
    @email_sender = 'warsawlease.pl <noreply@warsawlease.pl>'
    @email_recipient = params[:emailAddress]
    @email_subject = @context = 'Account Deletion Verification Code'
    send_verification
  end

  def destroy
    render_400 and return unless user_validated?
    render_400 and return if verification_code_invalid?
    @deleted_user = DeletedUser.find_by(id: @user.id) || DeletedUser.create(id: @user.id)
    @deleted_user_cipher = DeletedUserCipher.find_by(id: @user.id) || DeletedUserCipher.create(id: @user.id)
    @deleted_user.update_attributes(original_user: @user)
    @deleted_user_cipher.update_attributes(original_user_cipher: @user_cipher)
    @user.announcements.destroy_all
    @user.destroy
    @user_cipher.destroy
    render_200
  end
end