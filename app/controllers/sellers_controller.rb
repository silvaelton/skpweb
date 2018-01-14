require_dependency 'application_controller'

class SellersController < ApplicationController
  before_action :set_store
  before_action :set_seller, only: [:edit, :show, :update, :destroy]

  def index
    @sellers = @store.sellers
  end

  def new
    @seller = @store.sellers.new
  end

  def create
    @seller = @store.sellers.new(set_params)
    @seller.save
  end

  def show;end

  def edit;end

  def update
    @seller.update(set_params)
  end

  def destroy
    @seller.destroy
  end

  private

  def set_params
    params.require(:seller).permit(:name, :cnpj)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_seller
    @seller = @store.sellers.find(params[:id])
  end
end
