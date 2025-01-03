module ApplicationHelper

  def authentication_required
    redirect_to login_path unless logged_in?
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end

  def current_database
    @current_database = Database.find(session[:current_database_id]) if session[:current_database_id]
  end
end
