require_dependency 'application_controller'

class AvaliationCategoriesController < ApplicationController
  layout 'operation_application'

  before_action :set_store
  before_action :set_operation
  before_action :set_category, only: [:destroy]

  def index
    @categories = @operation.avaliation_categories
  end

  def new
    @category = @operation.avaliation_categories.new
  end

  def create
    @category = @operation.avaliation_categories.new(set_params)
    @category.save
  end

  def destroy
    @category.destroy

    redirect_to action: :index
  end

  def copy
    @category = CopyAvaliationCategory.new
  end

  def copy_create
    @category = CopyAvaliationCategory.new(set_copy_params)
    @category.operation_id = @operation.id
    @category.copy_and_paste if @category.valid?
  end

  private

  def set_copy_params
    params.require(:copy_avaliation_category).permit(:target_id)
  end

  def set_params
    params.require(:avaliation_category).permit(:name, :minimum_score)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_operation
    @operation = @store.operations.find(params[:operation_id])
  end

  def set_category
    @category = @operation.avaliation_categories.find(params[:id])
  end
end
