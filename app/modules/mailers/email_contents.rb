module Mailers::EmailContents
  HELLO = {
    'pl' => 'Witaj!',
    'en' => 'Hello!'
  }

  VERIFICATION_CODE_MESSAGE = {
    'pl' => 'Kod weryfikacyjny:',
    'en' => 'Verification code:'
  }

  COMPANY = {
    'pl' => 'Warsaw Digital Sp. z o.o., z siedzibą w Warszawie przy ul. Twardej 18, 00-105 Warszawa, zarejestrowana w rejestrze przedsiębiorców prowadzonym przez Sąd Rejonowy dla m. st. Warszawy, XII Wydział Gospodarczy Krajowego Rejestru Sądowego, pod numerem KRS 0000735294, o kapitale zakładowym 20.000,00 PLN, w pełni wpłaconym, posiadająca numer REGON 380529016 oraz numer NIP 5252753799',
    'en' => 'Warsaw Digital Sp. z o.o., with its registered office in Warsaw at Twarda 18 St., 00-105 Warsaw, registered in the register of entrepreneurs held by the District Court for the capital city of Warsaw, XII Commercial Division of the National Court Register, under the KRS number 0000735294, with share capital of 20,000.00 PLN, fully paid, with REGON number 380529016, and NIP number 5252753799'
  }

  private

  def verification_email
    @verification_code ||= @new_email_verification_code
    @body = "
    <div class='verification-code'>
      #{@verification_code}
    </div>"
    email_content = email
    @text_message = ActionView::Base.full_sanitizer.sanitize(email_content)
    email_content
  end

  def email
    "<html>
      <head>
        <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
        <style>
          #{common_styles}
          #{@style}
        </style>
      </head>
      <body>
        #{hello}
        #{verification_code_message}
        #{@body}
        #{logo_and_site}
        <div class='company'>
          #{company}
        </div>
      </body>
    </html>"
  end

  def hello
    "
      <div>
        #{HELLO[@language]}
      </div>
    "
  end

  def verification_code_message
    VERIFICATION_CODE_MESSAGE[@language]
  end

  def common_styles
    "
      * {
        line-height: 28px;
        color: #424949;
      }
      .company {
        margin-top: 12px;
        padding-top: 9px;
        border-top: 1px solid lightgray;
        text-align: justify;
        font-size: 11px;
        line-height: 16px;
        font-family: Arial, sans-serif;
        color: #5D6D7E;
      }
      .verification-code {
        margin: 3px 0;
        font-size: 24px;
        letter-spacing: 2px;
        font-weight: bold;
        color: #D35400;
      }
      .logo-and-site {
        margin-top: 12px;
        height: 36px;
      }
      .logo {
        width: 36px;
        float: left;
      }
      .site {
        margin-left: 8px;
        line-height: 36px;
        float: left;
      }
      .float-clear {
        clear: both;
      }
    "
  end

  def company
    COMPANY[@language]
  end

  def logo_and_site
    "
      <div class='logo-and-site'>
        <img
          class='logo'
          src='https://warsawlease.s3.eu-central-1.amazonaws.com/assets/warsawlease.pl-logo.jpg'
        >
        </img>
        <div class='site'>
          warsawlease.pl
        </div>
        <div class='float-clear'>
        </div>
      </div>
    "
  end
end
