# http://localhost:3001/rails/mailers/welcome
class WelcomePreview < ActionMailer::Preview
  def send_welcome_email
    WelcomeMailer.send_welcome_email
  end
end
