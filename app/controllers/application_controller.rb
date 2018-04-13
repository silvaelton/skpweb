class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :authenticate_user, :current_logged_user

  def current_user
    User.find(session[:user_id])
  rescue
    nil
  end

  def current_logged_user
    StoreUser.find(session[:user_store_id])
  rescue
    current_user
  end

  def authenticate_user
    if current_logged_user.nil?
      redirect_to new_session_path if controller_name != 'sessions'
    end
  end
end
