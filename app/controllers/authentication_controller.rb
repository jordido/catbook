class AuthenticationController < ApplicationController
  def new
  end

  def login
	  # Check if cat with email exists
	  cat = Cat.find_by_email(authentication_params[:email])
	  if cat && cat.authenticate(authentication_params[:password])
	    # Password is correct
	    # Set the session to current user
	    # Will use cookie
	    session[authentication_params[:cat]] = authentication_params[:cat]

	    redirect_to root_url
	  else
	    # There's no user or the password is incorrect
	    render :new
	  end
  end

  def destroy
   session[:cat_id] = nil
   redirect_to root_url
	end

	def authentication_params
    params.require(:cat).permit( :email, :password )
  end

end