class ProspectiveUserMailer < ApplicationMailer
  def send_verification_code(verification_code, prospective_user_id, email)
    @prospective_user_verification_code = verification_code
    mail(to: email, subject: "Verification Code WarsawLease.com")
    prospective_user = ProspectiveUser.find_by(id: prospective_user_id)
    prospective_user.save!
  end
end