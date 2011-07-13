require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users
  
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "invalid with empty attributes" do 
    user = User.new
    assert !user.valid? 
    assert user.errors.invalid?(:name)
  end
  
  test "check for length of name" do
    long_name = "a"*51
    user =User.new(:name => long_name)
    assert !user.valid?
  end
  
  test "should reject invalid emial addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
    invalid_email_user = User.new(:email => address)
    assert !invalid_email_user.valid?
    end
  end
  
  test "unique email" do
   user = User.new(:name => "aks", :email => users(:one).email)
   assert !user.save
  end
end
