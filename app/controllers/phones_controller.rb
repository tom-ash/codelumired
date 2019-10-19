class PhonesController < ApplicationController
  include UsersAuthorize
  include UsersCiphers
  include Responses
  include Mailers
  include Messages

  def verification
    return render_bad_request unless user_validated?

    decrypt_phone_body
    @phone = @user.phone['phone_code'] + @phone_body
    generate_verification
    @message = @verification_code
    send_sms
    return render_ok if @user.update_attributes(verification: @verification) &&
                         @user_cipher.update_attributes(verification_code_iv: @verification_code_iv)

    render_bad_request
  end
end
