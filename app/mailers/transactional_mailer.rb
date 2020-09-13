class TransactionalMailer < ApplicationMailer
  HELLO = {
    'pl' => 'Witaj!',
    'en' => 'Hello!'
  }

  VERIFICATION_CODE_MESSAGE = {
    'pl' => 'Kod weryfikacyjny:',
    'en' => 'Verification code:'
  }

  def verification_email(to:, verification_code:, language:)
    @verification_code = verification_code
    @language = language
    @subject = subject
    @hello = hello
    @verification_code_message = verification_code_message
    @company = company

    mail(
      from: 'warsawlease.pl <noreply@warsawlease.pl>',
      to: to,
      subject: @subject
    )
  end

  private

  def hello
    HELLO[@language]
  end

  def verification_code_message
    VERIFICATION_CODE_MESSAGE[@language]
  end

  def subject
    @language == 'pl' ? 'Rejestracja konta' : 'Account Registration'
  end
end
