class PhonesController < ApplicationController
  include UsersAuthorize
  include UsersCiphers
  include Responses
  include Messages

  def verification
    return bad_request unless user_validated?

    @phone = @user.phone['code'] + @user.phone['body']
    generate_verification
    @message = @verification_code
    send_sms
    return ok if @user.update(verification: @verification, verification_code_iv: @verification_code_iv)

    bad_request
  end
end
