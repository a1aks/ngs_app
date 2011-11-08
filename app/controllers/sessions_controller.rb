class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      # retrieving the user details from the datebase and displaying the user name in the flash message.
      flash[:success] = "Welcome #{user.name}"
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
    flash[:success] = "You are now Signed out.!"
    sign_out
    redirect_to root_path
  end
end