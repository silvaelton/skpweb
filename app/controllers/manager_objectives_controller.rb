require_dependency 'application_controller'

class ManagerObjectivesController < ApplicationController
  layout 'operation_application'

  before_action :set_store
  before_action :set_operation
  before_action :set_objective, only: [:edit, :update, :destroy]

  def index
    @objectives = @operation.manager_objectives
  end

  def new
    @objective = @operation.manager_objectives.new
  end

  def show; end

  def create
    @objective = @operation.manager_objectives.new(set_params)
    @objective.save
  end

  def edit; end

  def update
    @objective.update(set_params)
  end

  def destroy
    @objective.destroy

    redirect_to action: :index
  end

  private

  def set_params
    params.require(:manager_objective).permit(:name, :base_value, :verified)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_operation
    @operation = @store.operations.find(params[:operation_id])
  end

  def set_objective
    @objective = @operation.manager_objectives.find(params[:id])
  end
end
