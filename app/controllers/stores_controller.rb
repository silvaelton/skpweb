require_dependency 'application_controller'

class StoresController < ApplicationController
  before_action :authenticate_user
  before_action :set_store, only: [:edit, :show, :update, :destroy]
  before_action :set_stores

  def index;end

  def new
    @store = current_user.stores.new
  end

  def create
    @store = current_user.stores.new(set_params)
    @store.save
  end

  def show;end

  def edit;end

  def update
    @store.update(set_params)
  end

  def destroy
    @store.destroy

    redirect_to action: :index
  end

  private

  def set_params
    params.require(:store).permit(:name, :cnpj)
  end

  def set_store
    @store = current_user.stores.find(params[:id])
  end

  def set_stores
    @stores = current_user.stores
  end
end
