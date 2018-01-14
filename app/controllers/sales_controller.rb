require_dependency 'application_controller'

class SalesController < ApplicationController
  layout 'operation_application'

  before_action :set_store
  before_action :set_operation

  def index
    @operations = @store.operations
  end

  def new
    @operation = @store.operations.new
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
  end

  private

  def set_params
    params.require(:operation).permit(:name, :cnpj)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_operation
    @operation = @store.operations.find(params[:operation_id])
  end
end
