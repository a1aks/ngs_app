class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def show
     @user = User.find(params[:id])
   end
   
   def create
     @user = User.new(params[:user])
     if @user.save
       UserMailer.deliver_registration_confirmation(@user)
       sign_in @user
      flash[:success] = "Welcome to the SHWFGF!"
      redirect_to @user
     else
       @title = "Sign up"
       render 'new'
     end
   end
   
   def edit
    @title = "Edit user"
  end
    
  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
       @title = "Edit user"
      render 'edit'
    end
  end  
  
  def index
    @title = "All users" 
    @users = User.all
  end  
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end  
  
  # Method that lists the batches for the user 
  def list_batch            
   # Collect all the batch details 
   @batch = Batch.all
   # #Check if the user is the current_user 
   #    if current_user.id?
   #      # Put the current_user_id to the Batch.user_id
   #      @batch.user_id = current_user.id
   #    end
  end
  
  def view_samples  
    # Collect the samples for the batch selected
    # Pass the selected id of the batch to this place
    @batch = Batch.find(params[:id])  
  end 
  
  # Forgotten Password method 
  def forgot_password
    if request.post?
      unless params[:email].blank?
        user = User.find_by_email(params[:email])
        respond_to do |format|
          if user
            #  forgot_password! is a method in the user model that makes the random password
            user.forgot_password! 
            format.html {
              flash[:notice] = "A new password has been sent to you. Please check your mail"
              redirect_to signin_path
            }
            format.js { render :text => "A new password has been sent to you. Please check your email." }
          else
            format.html {
              flash[:error] = "We could not find a user with the given email address."
              redirect_to signin_path
            }
            format.js { render :text => "We could not find a user with the given email address.", :status => 500 }
          end
        end
      end
    end
  end
  
  
  private 
  
  
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end   
    
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end  
end
