# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.office365.com',
  :port           => '587',
  :authentication => :login,
  :user_name      => ENV['OFFICE_365_USER_NAME'],
  :password       => ENV['OFFICE_365_PASSWORD'],
  :domain         => MAPAWYNAJMU_PL_ROOT_DOMAIN,
  :enable_starttls_auto => true
}
