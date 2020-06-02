# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
gem 'sqlite3', '~> 1.4'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'devise-jwt', '~> 0.6.0'

group :development, :test do
  gem 'pry', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
