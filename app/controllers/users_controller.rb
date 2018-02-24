require_dependency 'application_controller'

class UsersController < ApplicationController # :nodoc:
  before_action :set_users
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @user = current_user.store_users.new
  end

  def create
    @user = current_user.store_users.new(set_params)
    @user.save
  end

  def edit; end

  def update
    if !params[:store_user][:password].present?
      params[:store_user].delete :password
    end
    @user.update(set_params)
  end

  def destroy
    @user.destroy
  end

  private

  def set_params
    params.require(:store_user).permit(:name,:email,:status,:password,:privilege)
  end

  def set_users
    @users = current_user.store_users.order(:id)
  end

  def set_user
    @user = current_user.store_users.find(params[:id])
  end
end
