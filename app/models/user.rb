require 'digest'

class User < ActiveRecord::Base
  # Associations 
  has_many :batches
  
  # Accessor Methods
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_presence_of :name, :email
  validates_length_of   :name, :maximum => 50
  validates_format_of :email, :with => EmailRegex
  validates_uniqueness_of :email, :case_sensitive => false
  
# Automatically create the virtual attribute 'password_confirmation'.
  validates_confirmation_of :password

# Password validations.
  validates_presence_of :password
  validates_length_of   :password, :within => 6..40
  
  before_save :encrypt_password
  
  # Returns true if the user's password matches the submitted password.
  def has_password?(submitted_password)
    # compare encrypted_password with the encrypted version of submitted_password
    encrypted_password == encrypt(submitted_password)
  end
  
  def remember_me!
      self.remember_token = encrypt("#{salt}--#{id}--#{Time.now.utc}")
      save_without_validation
  end
  
  def self.authenticate(email, submitted_password)
      user = find_by_email(email)
      return nil  if user.nil?
      return user if user.has_password?(submitted_password)
  end
    
  #   forgot_password
  def forgot_password!
    new_pass = User.random_string(10)
    self.password = self.password_confirmation = new_pass
    self.save
    UserMailer.deliver_forgotten_password(self, new_pass)
  end
  
  private 
  
  def encrypt_password
    unless password.nil?    
    self.salt = make_salt
    self.encrypted_password = encrypt(password)
  end
end
  
  
  def encrypt(string)
    secure_hash("#{salt}#{string}") 
  end    
  
  def make_salt
    secure_hash("#{Time.now.utc}#{password}")  
  end
      
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
  
  # Random_string method
  
  def self.random_string(len)
     #generate a random password consisting of strings and digits
     chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
     newpass = ""
     1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
     return newpass
   end
end

