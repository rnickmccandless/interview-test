# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '5.2.0'

gem 'autoprefixer-rails'
gem 'bootsnap', require: false
gem 'bootstrap'
gem 'coffee-rails'
gem 'devise'
gem 'jbuilder'
gem 'jquery-rails'
gem 'puma'
gem 'sass-rails'
gem 'sqlite3'
gem 'turbolinks'
gem 'uglifier'
gem 'webpacker'
gem 'paperclip', '~> 6.0.0'
gem 'haml-rails', '~> 1.0'
gem 'font-awesome-rails'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot_rails'
end

group :development do
  gem 'guard-rubocop'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
