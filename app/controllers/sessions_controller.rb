require_dependency 'application_controller'

class SessionsController < ApplicationController # :nodoc:

  def index
    redirect_to action: :new
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def set_params
  end

end
