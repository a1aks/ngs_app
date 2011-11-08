class UserMailer < ActionMailer::Base
  # Method that sends the email to the user attributes
  def registration_confirmation(user)
    recipients  user.email
    from        "webmaster@gmail.com"
    subject     "Thank you for Registering"
    body        :user => user
  end
  
  #  Forgotten password
  def forgotten_password(user, new_pass)
    recipients  user.email
    from        "webmaster@gmail.com"
    subject     "Your new password"
    body        :password => new_pass
    
    content_type  "text/html"
  end
end
