# frozen_string_literal: true

class TransactionalMailerPreview < ActionMailer::Preview
  # http://localhost:3001/rails/mailers/transactional_mailer/verification_email
  def verification_email
    to = 'example@example.net'
    subject = 'Verification Code'
    verification_code = 4242
    lang = 'pl'

    TransactionalMailer.verification_email(
      to: to, subject: subject, verification_code: verification_code, lang: lang,
    )
  end
end
