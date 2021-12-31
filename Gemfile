source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '~> 2.6.3'

gem 'aws-sdk-s3', '~> 1'
gem 'aws-sdk-ses', '~> 1.6'
gem 'bcrypt'
gem 'grape'
gem 'mailgun-ruby', '~>1.1.6'
gem 'pg', '~> 1.1.4'
gem 'puma', '~> 3.12'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 6.1.3'
gem 'rest-client'

gem 'sentry-ruby'
gem 'sentry-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'database_cleaner-active_record'
end

group :development do
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'soundof_it', path: 'sites/soundof_it'
gem 'warsawlease', path: 'sites/warsawlease'
