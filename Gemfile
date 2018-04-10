source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.0.rc2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'redis', '~> 4.0'
gem 'mini_magick', '~> 4.8'
gem 'devise'
gem 'turbolinks'
gem 'paymaya'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'simple_form', '3.5.1'
gem 'pg_search'

group :development, :test do
  gem 'rspec-rails', '~> 3.7'
  gem 'factory_bot_rails'
  gem 'faker'
end
group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'capybara'
  gem 'database_rewinder'
end
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
