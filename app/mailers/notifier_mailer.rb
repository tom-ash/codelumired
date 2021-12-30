class NotifierMailer < ApplicationMailer
  # http://localhost:3001/rails/mailers/welcome/send_welcome_email
  def before_name_change
    # TODO: USER
    @lang = 'pl'
    @company = company
    mail(
      to: 'test@test.pl',
      from: 'test@test.pl',
      subject: 'warsawlease.pl zmienia się w mapawynajmu.pl'
    )
  end
end
