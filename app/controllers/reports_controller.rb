class ReportsController < ApplicationController
  layout 'operation_application'

  before_action :set_store
  before_action :set_operation

  def index
  end

  private

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_operation
    @operation = @store.operations.find(params[:operation_id])
  end
end
