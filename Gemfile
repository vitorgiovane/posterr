source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"

gem 'dotenv-rails', groups: [:development, :test]

gem 'paranoia', '~> 2.6'

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

gem 'rack-cors'

gem 'rack-attack'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

gem "pg", "~> 1.3"

gem 'active_model_serializers'

gem 'will_paginate', '~> 3.3', '>= 3.3.1'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
end


