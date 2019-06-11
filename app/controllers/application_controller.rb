class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :logged_in_user, :log_out, :login

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please log in first'
      redirect_to login_url
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
