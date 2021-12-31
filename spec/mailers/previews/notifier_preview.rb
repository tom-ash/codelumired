# frozen_string_literal: true

class NotifierPreview < ActionMailer::Preview
  # http://localhost:3001/rails/mailers/notifier/before_name_change
  def before_name_change
    user = ::MapawynajmuPl::User.first
    NotifierMailer.before_name_change(user)
  end
end
