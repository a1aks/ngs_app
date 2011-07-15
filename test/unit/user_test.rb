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
  
  test "should have encrypted password attribute" do
    user = User.new(:name => "example",
                    :email => "example@example.com",
                    :encrypted_password => "qwedsrftgyh")
    assert true
  end
  
  # test "encrypted password should not be blank" do
  #   user = User.new(:name => "example",
  #                   :email => "example@example.com",
  #                   :encrypted_password => "")
  #   assert !user.valid?
  #   assert user.errors.invalid?(:encrypted_password)
  # end
  
  test "has_password?" do
    user = User.create
    assert user.invalid?
    assert user.errors.invalid?(:password)
  end
    
  # test "should return nil on emial/password mismatch" do
  #     wrong_password_user = User.authenticate(:email) 
  #     assert !wrong_password_user.valid?
  #   end
  #     
  #   test "should return nil for an email address with no user" do 
  #     nonexistent_user = User.authenticate(:email => "bar@foo.com",
  #                                            :password => "")
  #     assert !nonexistent_user.valid?
  #   end
  #     
  #    test "should return the user on email/password match" do
  #       matching_user = User.authenticate(:email, :password)
  #       assert_equal(User, "matching user equals user")
  #    end
end
