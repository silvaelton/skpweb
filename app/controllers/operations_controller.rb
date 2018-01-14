require_dependency 'application_controller'

class OperationsController < ApplicationController
  layout 'sub_application'

  before_action :set_store
  before_action :set_operation, only: [:edit, :show, :update, :destroy]

  def index
    @operations = @store.operations
  end

  def new
    @operation  = @store.operations.new
  end

  def create
    @operation = @store.operations.new(set_params)
    @operation.save
  end

  def show
    render layout: 'operation_application'
  end

  def edit;end

  def update
    @operation.update(set_params)
  end

  def destroy
    @operation.destroy

    redirect_to store_operations_path(@store)
  end

  private

  def set_params
    params.require(:operation).permit(:name, :observation, :started_at, :ended_at,
      :value_start, :value_goal, :percent_start, :percent_goal, :percent_fixed_goal, :status)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_scope
    @scope = @store.scopes.find(params[:scope_id])
  end

  def set_operation
    @operation = @store.operations.find(params[:id])
  end
end
