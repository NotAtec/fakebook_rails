source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  gem 'pry-rails', '~> 0.3.9'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'factory_bot_rails', '~> 6.2'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'binding_of_caller', '~> 1.0'
  gem 'annotate', '~> 3.2'

  gem 'letter_opener', '~> 1.8', '>= 1.8.1'

  gem 'guard', '~> 2.18'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3', require: false
  gem 'guard-livereload', '~> 2.5', '>= 2.5.2', require: false
  gem 'spring-commands-rspec', '~> 1.0', '>= 1.0.4'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.37', '>= 3.37.1'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'

  gem 'launchy', '~> 2.5'
  gem 'shoulda-matchers', '~> 5.1'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
end

gem "devise", "~> 4.8"
gem "faker", "~> 2.23"
gem "figaro", "~> 1.2"
gem "omniauth-facebook", "~> 9.0"
gem "omniauth-github", "~> 2.0"
gem "omniauth-rails_csrf_protection", "~> 1.0"
gem "geocoder", "~> 1.8"
gem "simple_form", "~> 5.1"

gem "gravtastic", "~> 3.2"
