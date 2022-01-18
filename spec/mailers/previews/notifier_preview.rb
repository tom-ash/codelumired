# frozen_string_literal: true

class NotifierPreview < ActionMailer::Preview
  # http://localhost:3001/rails/mailers/notifier/before_name_change
  def before_name_change
    user = ::MapawynajmuPl::User.first
    NotifierMailer.before_name_change(user)
  end

  # http://localhost:3001/rails/mailers/notifier/after_name_change
  def after_name_change
    user = ::MapawynajmuPl::User.first
    NotifierMailer.after_name_change(user)
  end
end
