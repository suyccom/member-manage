source 'http://rubygems.org'

gem 'rails', '3.0.10'
gem 'abstract'
gem "hobo", "= 1.3.0"
gem "rspec-rails", ">= 2.5.0", :group => [:test, :development]
gem "hobo-jquery", :git => "git://github.com/bryanlarsen/hobo-jquery.git", :branch => "rails3"
gem "meta_search", "=1.0.6"
gem 'sqlite3'
gem 'activerecord-mysql2-adapter'

group :development, :test do
  #gem 'webrat'
  gem 'rails-dev-boost', :git => 'git://github.com/thedarkone/rails-dev-boost.git', :require => 'rails_development_boost'
  gem 'thin', '1.4.1'
  gem 'database_cleaner'
  gem 'better_errors'
  gem 'yaml_db'
end

group :test do
  gem "autotest"
  gem "autotest-growl"
  gem "capybara"
  gem "capybara-webkit"
  gem "spork"
end

group :console do
  gem 'awesome_print'
end
