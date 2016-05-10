class SessionsController < ApplicationController
  before_filter :authenticate_user! 

  def create
  	# render text: request.env['omniauth.auth'].to_yaml 
	  @user = User.from_omniauth(request.env['omniauth.auth'])
	    session[:user_id] = @user.id
	    flash[:success] = "Welcome there, #{@user.name}!"
	 	# else
	  #   flash[:warning] = "There was an error while trying to authenticate you..."
	  # end
	  redirect_to root_path
	end


   def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end

  def auth_failure
    redirect_to root_path
  end
end

