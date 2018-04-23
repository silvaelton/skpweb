require_dependency 'application_controller'

class OwnersController < ApplicationController
  layout 'sub_application'

  before_action :set_store
  before_action :set_owner, only: [:edit, :show, :update, :destroy]

  def index; end

  def new
    @owner = @store.owners.new
  end

  def create
    @owner = @store.owners.new(set_params)
    @owner.save
  end

  def show
    @owners = @store.owners
    @owners = @store.operations
  end

  def edit;end

  def update
    @owner.update(set_params)
  end

  def destroy
    @owner.destroy

    redirect_to action: :index
  end

  private

  def set_params
    params.require(:owner).permit(:name, :cpf, :code, :telephone, :email)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_owner
    @owner = @store.owners.find(params[:id])
  end
end
