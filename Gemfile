source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.2'
gem 'pg', '~> 1.1.4'
gem 'puma', '~> 3.12'
gem 'bcrypt'
gem 'mailgun-ruby', '~>1.1.6'

gem 'rack-cors', require: 'rack/cors'
gem 'twilio-ruby', '~> 5.7.2'
gem 'aws-sdk-s3', '~> 1'
gem 'aws-sdk-ses', '~> 1.6'

gem 'rest-client'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
end

group :development do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
