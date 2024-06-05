# frozen_string_literal: true

class SkillfindTechMailerPreview < ActionMailer::Preview
  # http://localhost:3001/rails/mailers/skillfind_tech_mailer/account_verification_email
  def account_verification_email
    to = 'example@example.net'
    verification_code = 4242
    lang = 'en'

    ::SkillfindTech::Mailers::Poster::Verification::Account::Sender.prepare(
      to: to, verification_code: verification_code, lang: lang,
    )
  end

  # http://localhost:3001/rails/mailers/skillfind_tech_mailer/account_verification_email_pl
  def account_verification_email_pl
    to = 'example@example.net'
    verification_code = 4242
    lang = 'pl'

    ::SkillfindTech::Mailers::Poster::Verification::Account::Sender.prepare(
      to: to, verification_code: verification_code, lang: lang,
    )
  end

  # http://localhost:3001/rails/mailers/skillfind_tech_mailer/password_verification_email
  def password_verification_email
    to = 'example@example.net'
    verification_code = 4242
    lang = 'en'

    ::SkillfindTech::Mailers::Poster::Verification::Password::Sender.prepare(
      to: to, verification_code: verification_code, lang: lang,
    )
  end

  # http://localhost:3001/rails/mailers/skillfind_tech_mailer/password_verification_email_pl
  def password_verification_email_pl
    to = 'example@example.net'
    verification_code = 4242
    lang = 'pl'

    ::SkillfindTech::Mailers::Poster::Verification::Password::Sender.prepare(
      to: to, verification_code: verification_code, lang: lang,
    )
  end
end
