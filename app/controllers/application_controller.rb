class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/' unless current_user
  end

  def login(user)
    session[:user_id] = user.id
  end

  def owned?(user)
    user.user_id == (user.try(:id) || user)
  end

  def logout
    session.clear
  end
end
