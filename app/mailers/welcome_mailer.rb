class WelcomeMailer < ApplicationMailer
  # http://localhost:3001/rails/mailers/welcome/send_welcome_email
  def send_welcome_email
    # TODO: USER
    @lang = 'pl'
    @company = company
    mail(
      to: 'test@test.pl',
      from: 'test@test.pl',
      subject: 'Test Subject'
    )
  end
end
