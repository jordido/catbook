class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	if session[:cat_id]
	    # If current cat is set in the session
	    # return the current cat
	    @current_user ||= Cat.find(session[:cat_id])
   	end
 	end

	helper_method :current_user

end
