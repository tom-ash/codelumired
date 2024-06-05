class SkillfindTechMailer < ActionMailer::Base
  default from: "#{SKILLFIND_TECH_NAME} <noreply@#{SKILLFIND_TECH_APEX_DOMAIN}>"
  layout 'skillfind_tech_mailer'

  COMPANY = {
    'pl' => 'Warsaw Digital Sp. z o.o., z siedzibą w Warszawie przy ul. Twardej 18, 00-105 Warszawa, zarejestrowana w rejestrze przedsiębiorców prowadzonym przez Sąd Rejonowy dla m. st. Warszawy, XII Wydział Gospodarczy Krajowego Rejestru Sądowego, pod numerem KRS 0000735294, o kapitale zakładowym 20.000,00 PLN, w pełni wpłaconym, posiadająca numer REGON 380529016 oraz numer NIP 5252753799',
    'en' => 'Warsaw Digital Sp. z o.o., with its registered office in Warsaw at Twarda 18 St., 00-105 Warsaw, registered in the register of entrepreneurs held by the District Court for the capital city of Warsaw, XII Commercial Division of the National Court Register, under the KRS number 0000735294, with share capital of 20,000.00 PLN, fully paid, with REGON number 380529016, and NIP number 5252753799'
  }

  def company
    # COMPANY[@lang] # TODO: FIX !!!
    'Warsaw Digital Sp. z o.o., z siedzibą w Warszawie przy ul. Twardej 18, 00-105 Warszawa, zarejestrowana w rejestrze przedsiębiorców prowadzonym przez Sąd Rejonowy dla m. st. Warszawy, XII Wydział Gospodarczy Krajowego Rejestru Sądowego, pod numerem KRS 0000735294, o kapitale zakładowym 20.000,00 PLN, w pełni wpłaconym, posiadająca numer REGON 380529016 oraz numer NIP 5252753799'
  end

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

  def hello
    HELLO[@lang]
  end

  def verification_code_message
    VERIFICATION_CODE_MESSAGE[@lang]
  end

  def account_verification_email(to:, subject:, verification_code:, lang:)
    @verification_code = verification_code
    @lang = lang
    @subject = subject
    @hello = hello
    @verification_code_message = verification_code_message
    @signature = 'skillfind.tech'
    @salutations = SALUTATIONS[@lang]
    @company = company

    mail(
      from: "#{SKILLFIND_TECH_NAME} <noreply@#{SKILLFIND_TECH_APEX_DOMAIN}>",
      to: to,
      subject: @subject
    )
  end

  private

end
