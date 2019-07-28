class PhonesController < ApplicationController
  include UsersGeneral
  include UsersCiphers
  include UsersEdit
  include Responses
  include Mailers
  include Messages

  def verification
    render_400 and return unless user_validated?
    decrypt_phone_body
    @phone = @user.phone['phone_code'] + @phone_body
    generate_verification
    @message = @verification_code
    send_sms
    # send_verification_code
    render_200 and return if @user.update_attributes(verification: @verification) &&
                             @user_cipher.update_attributes(verification_code_iv: @verification_code_iv)
    render_400
  end
end