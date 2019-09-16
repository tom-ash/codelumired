class UserMailer < ApplicationMailer
  def send_password_reset_verification_code(verification_code, email)
    @verification_code = verification_code
    mail(to: email, subject: "warsawlease.pl Password Reset Verification Code")
  end
end