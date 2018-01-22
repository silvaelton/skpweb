require_dependency 'application_controller'

class ManagersController < ApplicationController
  layout 'sub_application'

  before_action :set_store
  before_action :set_manager, only: [:edit, :show, :update, :destroy]

  def index
    @managers = @store.managers
  end

  def new
    @manager = @store.managers.new
  end

  def create
    @manager = @store.managers.new(set_params)
    @manager.save
  end

  def show;end

  def edit;end

  def update
    @manager.update(set_params)
  end

  def destroy
    @manager.destroy

    redirect_to action: :index
  end

  private

  def set_params
    params.require(:manager).permit(:name,:cpf, :observation ,:telephone ,:code)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_manager
    @manager = @store.managers.find(params[:id])
  end
end
