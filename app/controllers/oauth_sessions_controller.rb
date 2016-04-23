class OauthSessionsController < ApplicationController

  def create
    binding.pry
    auth = request.env["omniauth.auth"]
    session[:user_id] = auth["uid"]
    session[:user_info] = auth["info"]
    @current_user = session[:user_info]
    @uid = auth.uid
    @battletag = auth['info']['battletag']
    @user = User.new(uid: @uid, battletag: @battletag)
    session[:current_user] = auth['info']
binding.pry
    if @user.save
      root_path
    elsif Guild.exists?
      root_path
    else
      @user = User.find_by uid: "#{@uid}"
    end
    binding.pry
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    session[:user_info] = nil
    redirect_to root_path
  end

end
