class UsersController < ApplicationController
  include Realms
  def show
    @realm_list = Realms::US_REALM_LIST
    uid = session[:user_id]
    @user = User.find_by_uid(uid)
    @guild = Guild.new
    @parties = @user.parties
  end
end
