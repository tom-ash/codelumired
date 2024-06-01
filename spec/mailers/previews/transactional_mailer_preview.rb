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

  # http://localhost:3001/rails/mailers/transactional_mailer/listing_confirmation_email
  def listing_confirmation_email
    to = 'example@example.net'
    listing_id = ::MapawynajmuPl::Listing.first.id
    lang = 'pl'

    TransactionalMailer.listing_confirmation_email(
      to: to, listing_id: listing_id, lang: lang,
    )
  end

  ###

  # http://localhost:3001/rails/mailers/transactional_mailer/skillfind_tech_verification_email
  def skillfind_tech_verification_email
    # from
    to = 'example@example.net'
    subject = 'Verification Code'
    verification_code = 4242
    lang = 'en'

    TransactionalMailer.skillfind_tech_verification_email(
      to: to, subject: subject, verification_code: verification_code, lang: lang,
    )
  end

  # http://localhost:3001/rails/mailers/transactional_mailer/skillfind_tech_verification_email_pl
  def skillfind_tech_verification_email_pl
    # from
    to = 'example@example.net'
    subject = 'Verification Code'
    verification_code = 4242
    lang = 'pl'

    TransactionalMailer.skillfind_tech_verification_email(
      to: to, subject: subject, verification_code: verification_code, lang: lang,
    )
  end
end
