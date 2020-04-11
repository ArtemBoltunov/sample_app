require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

  def setup
    @user_activated = users(:tester)
    @user_show = users(:seconder)
    @user_not_activated = users(:unactiver)
  end
  
  test "show user from if activeted and not" do
     log_in_as(@user_activated)
     get user_path(@user_show)
     assert_template 'users/show'
     # Simulate a user clicking logout in a second window. 
     delete logout_path
     follow_redirect!
     log_in_as(@user_not_activated)
     assert_redirected_to root_url
  end
end
