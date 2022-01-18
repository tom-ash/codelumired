# frozen_string_literal: true

class NotifierMailer < ApplicationMailer
  # http://localhost:3001/rails/mailers/notifier/before_name_change
  def before_name_change(user)
    @lang = 'pl'
    @company = company
    mail(
      to: user.email,
      from: 'kontakt@warsawlease.pl',
      subject: 'warsawlease.pl zmienia się w mapawynajmu.pl'
    )
  end

  # http://localhost:3001/rails/mailers/notifier/after_name_change
  def after_name_change(user)
    @lang = 'pl'
    @company = company
    mail(
      to: user.email,
      from: 'kontakt@warsawlease.pl',
      subject: 'warsawlease.pl zmienia się w mapawynajmu.pl'
    )
  end
end
