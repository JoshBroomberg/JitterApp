class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController 
#class OmniauthCallbacksController < Devise::OmniauthCallbacksController 

def facebook 
# You need to implement the method below in your model 
@user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user) 
if @user.persisted? 
	flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook" 
	#sign_in_and_redirect @user, :event => :authentication
	
	#sign_in @user, :event => :authentication
	#@profile = Profile.new
	#render "profiles/new"

  sign_in @user, :event => :authentication
  if @user.profile != nil
     redirect_to feed_path
  else
    sign_in @user
    @profile = Profile.new
	render "profiles/new"
  end
	
else 
	session["devise.facebook_data"] = request.env["omniauth.auth"] 
	redirect_to new_user_registration_url 
end 
end 

def passthru 
	render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false 
	end
end