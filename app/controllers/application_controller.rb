class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :authenticate_user

  def current_user
    User.find(session[:user_id])
  rescue
    nil
  end

  def authenticate_user
    redirect_to new_session_path if current_user.nil? && !controller_name != 'sessions'
  end
end
