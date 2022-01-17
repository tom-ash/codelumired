class TransactionalMailer < ApplicationMailer
  HELLO = {
    'pl' => 'Witaj!',
    'en' => 'Hello!'
  }

  VERIFICATION_CODE_MESSAGE = {
    'pl' => 'Kod weryfikacyjny:',
    'en' => 'Verification code:'
  }

  def verification_email(to:, subject:, verification_code:, lang:)
    @verification_code = verification_code
    @lang = lang
    @subject = subject
    @hello = hello
    @verification_code_message = verification_code_message
    @company = company

    mail(
      from: "#{MAPAWYNAJMU_PL_NAME} <noreply@w#{MAPAWYNAJMU_PL_ROOT_DOMAIN}>",
      to: to,
      subject: @subject
    )
  end

  private

  def hello
    HELLO[@lang]
  end

  def verification_code_message
    VERIFICATION_CODE_MESSAGE[@lang]
  end
end
