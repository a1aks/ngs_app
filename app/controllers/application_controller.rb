# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  # before_filter :authenticate
  helper :all # include all helpers, all the time
  #protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include SessionsHelper
  # Scrub sensitive parameters from your log
   filter_parameter_logging :password
   
   private 
   
   # def authenticate
   #      deny_access unless signed_in?
   #    end
end
