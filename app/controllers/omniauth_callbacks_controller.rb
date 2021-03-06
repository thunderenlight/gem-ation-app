class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def provider
		p env['omniauth.auth']
		@user = User.from_omniauth(request.env['omniauth.auth'])
		 if @user.persisted?
	      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
	      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
	    else
 				session["devise.user_attributes"] = @user.attributes
 				redirect_to new_user_registration_url
	    end
	  end

  def failure
    redirect_to root_path
  end
	alias_method :facebook, :provider

end
