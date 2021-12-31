# frozen_string_literal: true

class NotifierMailer < ApplicationMailer
  # http://localhost:3001/rails/mailers/welcome/send_welcome_email
  def before_name_change(user)
    @lang = 'pl'
    @company = company
    mail(
      to: user.email,
      from: 'kontakt@warsawlease.pl',
      subject: 'warsawlease.pl zmienia się w mapawynajmu.pl'
    )
  end
end
