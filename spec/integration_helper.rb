# encoding: UTF-8

require 'spec_helper'
require 'capybara/rspec'
require 'database_cleaner'

Capybara.javascript_driver = :selenium
Capybara.default_driver = :selenium
#Capybara.javascript_driver = :webkit
#Capybara.default_driver = :webkit

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

module IntegrationHelpers

  def login(user)
    visit '/'
    fill_in 'login', :with => user.email_address
    fill_in 'password', :with => 'grover_sesamestreet'
    click_on 'Iniciar Sesión'
  end

  def logout(user)
    click_link('Terminar Sesión')
  end

end
