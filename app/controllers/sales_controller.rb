require_dependency 'application_controller'

class SalesController < ApplicationController
  layout 'operation_application'

  before_action :set_store
  before_action :set_operation
  before_action :set_sale, only: [:destroy]

  def index
    @sales = @operation.sales
  end

  def new
    @sale = @operation.sales.new
  end

  def create
    @sale = @operation.sales.new(set_params)
    @sale.save
  end

  def show
    render layout: 'operation_application'
  end

  def edit;end

  def update
    @sale.update(set_params)
  end

  def destroy
    @sale.destroy

    redirect_to action: :index
  end

  private

  def set_params
    params.require(:sale).permit(:seller_id, :value)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_operation
    @operation = @store.operations.find(params[:operation_id])
  end

  def set_sale
    @sale = @operation.sales.find(params[:id])
  end
end
