# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.default_url_options = { :host => 'https://www.warsawlease.pl' }
#ActionMailer::Base.default_url_options = { :host => 'http://localhost:3001' }
ActionMailer::Base.smtp_settings = {
    address: 'smtp.live.com',
    port: 587,
    user_name: Rails.application.secrets.administrator_email,
    password: Rails.application.secrets.administrator_email_password,
    authentication: 'login',
    :enable_starttls_auto => true 
}
