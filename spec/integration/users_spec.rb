# encoding: UTF-8

require 'integration_helper'
require 'spec_helper'

feature "Users stuff" do

  include IntegrationHelpers

  before :each do
    login($grover)
  end

  after :each do
    logout($grover)
  end

  scenario "On Members should be like user@domain.xxx " do
    visit '/members/'
    page.should have_content('bert@sesamestreet.net')
    page.should have_content('ernie@sesamestreet.net')
    sleep 3
  end

end
