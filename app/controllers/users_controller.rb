class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.databases << Database.new(name: "Default")
    if @user.save
      session[:current_user_id] = @user.id
      session[:current_database_id] = @user.databases.first.id
      redirect_to root_path
    else
      render :new
    end
  end
  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
