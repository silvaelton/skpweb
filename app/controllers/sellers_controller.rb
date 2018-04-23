require_dependency 'application_controller'

class SellersController < ApplicationController
  layout 'sub_application'

  before_action :set_store
  before_action :set_seller, only: [:edit, :show, :update, :destroy]

  def index; end

  def new
    @seller = @store.sellers.new
  end

  def create
    @seller = @store.sellers.new(set_params)
    @seller.save
  end

  def show
    @sellers = @store.sellers
    @sellers = @store.operations
  end

  def edit;end

  def update
    @seller.update(set_params)
  end

  def destroy
    @seller.destroy

    redirect_to action: :index
  end

  private

  def set_params
    params.require(:seller).permit(:name, :cpf, :code, :telephone, :email)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_seller
    @seller = @store.sellers.find(params[:id])
  end
end
