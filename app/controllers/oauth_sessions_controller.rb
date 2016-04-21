class OauthSessionsController < ApplicationController

  def create
    # auth = request.env["omniauth.auth"]
    # session[:user_id] = auth["uid"]
    # session[:user_info] = auth["info"]
    # redirect OmniAuth.config.full_host
    binding.pry
    redirect_to root_path
  end

  def delete
    redirect_to root_path
  end

end
