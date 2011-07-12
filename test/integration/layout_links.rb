require 'test_helper'
class LayoutLinks < ActionController::IntegrationTest
  test "should have a signup page at '/signup" do
    get '/signup'
    assert_template "user/new"
  end
end