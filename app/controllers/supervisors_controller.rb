require_dependency 'application_controller'

class SupervisorsController < ApplicationController
  layout 'sub_application'

  before_action :set_store
  before_action :set_supervisor, only: [:edit, :show, :update, :destroy]

  def index; end

  def new
    @supervisor = @store.supervisors.new
  end

  def create
    @supervisor = @store.supervisors.new(set_params)
    @supervisor.save
  end

  def show
    @supervisors = @store.supervisors
    @supervisors = @store.operations
  end

  def edit;end

  def update
    @supervisor.update(set_params)
  end

  def destroy
    @supervisor.destroy

    redirect_to action: :index
  end

  private

  def set_params
    params.require(:supervisor).permit(:name, :cpf, :code, :telephone, :email)
  end

  def set_store
    @store = current_user.stores.find(params[:store_id])
  end

  def set_supervisor
    @supervisor = @store.supervisors.find(params[:id])
  end
end
