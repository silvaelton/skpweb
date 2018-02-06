require_dependency 'application_controller'

class AvaliationItemsController < ApplicationController
  layout 'operation_application'

  before_action :set_store
  before_action :set_operation
  before_action :set_item, only: [:destroy, :edit, :update]

  def index
    @items = @operation.avaliation_items
  end

  def new
    @item = @operation.avaliation_items.new
  end

  def create
    @item = @operation.avaliation_items.new(set_params)
    @item.save
  end

  def edit; end

  def update
    @item.update(set_params)
  end

  def destroy
    @item.destroy

    redirect_to action: :index
  end

  private

  def set_params
    params.require(:avaliation_item).permit(:name, :avaliation_category_id)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_operation
    @operation = @store.operations.find(params[:operation_id])
  end

  def set_item
    @item = @operation.avaliation_items.find(params[:id])
  end
end
