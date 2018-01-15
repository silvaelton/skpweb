require_dependency 'application_controller'

class ManagerAvaliationItemsController < ApplicationController
  layout 'operation_application'

  before_action :set_store
  before_action :set_operation
  before_action :set_avaliation

  def update
    @item = @avaliation.manager_avaliation_items.find(params[:id])
    @item.update(set_params)
  end

  private

  def set_params
    params.require(:manager_avaliation_item).permit(:score)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_operation
    @operation = @store.operations.find(params[:operation_id])
  end

  def set_avaliation
    @avaliation = @operation.manager_avaliations.find(params[:manager_avaliation_id])
  end
end
