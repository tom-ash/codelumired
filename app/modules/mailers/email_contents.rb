module Mailers::EmailContents
  private

  def verification_email
    "<html>
      <head>
        <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
        <style>
          .verification-code {
            color: red;
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 20px;
          }
          .logo {
            border: 1px solid;
            padding: 0px 3px 1px 3px;
            border-radius: 4px;
            margin-left: 2px;
          }
          .company {
            margin-top: 18px;
            font-size: 10px;
            text-align: justify;
            border-top: 1px solid gray;
            padding-top: 9px;
          }
        </style>
      </head>
      <body>
        <div class='verification-code'>
          #{@verification_code}
        </div>
        <div>
          Warsaw
          <span class='logo'>
            Lease
          </span>
        </div>
        <div class='company'>
          #{company}
        </div>
      </body>
    </html>"
  end

  def company
    return 'Warsaw Digital Sp. z o.o., z siedzibą w Warszawie przy ul. Twardej 18, 00-105 Warszawa, zarejestrowana w rejestrze przedsiębiorców prowadzonym przez Sąd Rejonowy dla m. st. Warszawy, XII Wydział Gospodarczy Krajowego Rejestru Sądowego, pod numerem KRS 0000735294, o kapitale zakładowym 20.000,00 PLN, w pełni wpłaconym, posiadająca numer REGON 380529016 oraz numer NIP 5252753799' if @language == 'polish'

    'Warsaw Digital Sp. z o.o., with its registered office in Warsaw at Twarda 18 St., 00-105 Warsaw, registered in the register of entrepreneurs held by the District Court for the capital city of Warsaw, XII Commercial Division of the National Court Register, under the KRS number 0000735294, with share capital of 20,000.00 PLN, fully paid, with REGON number 380529016, and NIP number 5252753799'
  end
end
