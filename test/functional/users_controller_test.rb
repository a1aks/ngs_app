require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  #Checking whether the new page is rendered
  test "new" do
    get :new
    assert_response :success
  end
  
  # test that new has the right title
  test "should have the right title"do 
  get :new
  assert_equal "title", /Sign up/
  end
end
