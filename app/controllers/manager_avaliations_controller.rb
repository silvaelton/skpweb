require_dependency 'application_controller'

class ManagerAvaliationsController < ApplicationController
  layout 'operation_application'

  before_action :set_store
  before_action :set_operation
  before_action :set_avaliation, only: [:destroy, :show]

  def index
    @avaliations = @operation.manager_avaliations
  end

  def new
    @avaliation = @operation.manager_avaliations.new
  end

  def show; end

  def create
    @avaliation = @operation.manager_avaliations.new(set_params)
    @avaliation.save
  end

  def destroy
    @avaliation.destroy

    redirect_to action: :index
  end

  private

  def set_params
    params.require(:manager_avaliation).permit(:observation, :avaliation_category_id, :minimum_value)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_operation
    @operation = @store.operations.find(params[:operation_id])
  end

  def set_avaliation
    @avaliation = @operation.manager_avaliations.find(params[:id])
  end
end
