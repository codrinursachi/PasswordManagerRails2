class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:current_database_id] = @user.databases.first.id if @user.databases.first
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:current_database_id)
    redirect_to root_path
  end
end
