# frozen_string_literal: true

class TransactionalMailer < ApplicationMailer
  include ::MapawynajmuPl::ProtocolAndDomain

  HELLO = {
    'pl' => 'Witaj!',
    'en' => 'Hello!',
  }

  VERIFICATION_CODE_MESSAGE = {
    'pl' => 'Twój jednorazowy kod weryfikacyjny to:',
    'en' => 'Verification code:',
  }

  SALUTATIONS = {
    'pl' => 'Pozdrawiamy!',
    'en' => 'Best regards!',
  }

  # http://localhost:3001/rails/mailers/transactional_mailer/verification_email
  def verification_email(to:, subject:, verification_code:, lang:)
    @verification_code = verification_code
    @lang = lang
    @subject = subject
    @hello = hello
    @verification_code_message = verification_code_message
    @signature = 'mapawynajmu.pl'
    @salutations = SALUTATIONS[@lang]
    @company = company

    mail(
      from: "#{MAPAWYNAJMU_PL_NAME} <noreply@#{MAPAWYNAJMU_PL_APEX_DOMAIN}>",
      to: to,
      subject: @subject
    )
  end

  # http://localhost:3001/rails/mailers/transactional_mailer/listing_confirmation_email
  def listing_confirmation_email(to:, listing_id:, lang:)
    @lang = lang
    @subject = {
      'pl' => 'Potwierdzenie dodania ogłoszenia',
      'en' => 'Listing adding confirmation',
    }[@lang]
    @hello = hello
    @your_announcement_has_been_added = your_announcement_has_been_added
    @listing = ::MapawynajmuPl::Listing.find(listing_id)
    @listing_id = @listing.id
    @listing_picture = "#{AWS_S3_MAPAWYNAJMUPL_URL}/announcements/#{@listing_id}/#{@listing.pictures.first['database']}"
    @listing_url = "#{protocol_and_domain}/#{@listing.url(@lang)}"
    @signature = 'mapawynajmu.pl'
    @salutations = SALUTATIONS[@lang]
    @company = company

    mail(
      from: "#{MAPAWYNAJMU_PL_NAME} <noreply@#{MAPAWYNAJMU_PL_APEX_DOMAIN}>",
      to: to,
      subject: @subject,
    )
  end

  private

  def hello
    HELLO[@lang]
  end

  def verification_code_message
    VERIFICATION_CODE_MESSAGE[@lang]
  end

  def your_announcement_has_been_added
    {
      'pl' => 'Twoje ogłoszenie zostało dodane pomyślnie!',
      'en' => 'Your listing has been added successfully!',
    }[@lang]
  end
end
