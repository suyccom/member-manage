require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # This test is true always  
  test "the truth" do
    assert true
  end

  # This test fails always
  test "this should fail because no name" do
    user = User.new
    user.save!
  end

end
