class UsersController < ApplicationController
  def index
    @users = User.order(:username).page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    )
    if @user.save
      flash[:notice] = "#{@user.username} is created"
    else
      flash[:alert] = "Account not created"
    end
    redirect_to new_user_path
  end

  def destroy
    @user = User.find(params['id'])
    @user.destroy
    flash[:notice] = "User was deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :encrypted_password)
  end
end

end
