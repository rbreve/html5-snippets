class SessionsController < ApplicationController
  def create

    auth = request.env["omniauth.auth"]  

    user = User.find_by_provider_and_uid(auth[:provider], auth[:uid]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    
    if session[:next]
      redirect_to session[:next], :notice => "Signed In"
    else
      redirect_to root_url, :notice => "Signed In"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signout Out"
  end
end
