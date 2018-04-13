require_dependency 'application_controller'

class SessionsController < ApplicationController # :nodoc:
  layout 'session'

  def index
    redirect_to action: :new
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(set_params)
    if @session.valid?
      session[:user_id] = @session.id
      session[:user_store_id] = @session.user_id
      redirect_to stores_path
    else
      render action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_store_id] = nil

    redirect_to new_session_path
  end

  private

  def set_params
    params.require(:session).permit(:email, :password)
  end

end
