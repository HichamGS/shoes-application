class StoresController < ApplicationController
  before_action :set_store, only: %i[show update destroy]
  # get /stores
  def index
    @stores = if params[:keyword]
        Store.where(name: params[:keyword]).first
      else
        Store.all
      end
    json_response(@stores)
  end

  # get /stores/:id
  def show
    json_response(@store)
  end

  # POST /stores
  def create
    @store = Store.create!(store_params)
    json_response(@store, :created)
  end

  # PUT /stores/:id
  def update
    @Store.update(store_params)
    head :no_content
  end

  # DELETE /stores/:id
  def destroy
    @Store.destroy
    head :no_content
  end

  private

  def store_params
    params.permit(:name)
  end

  def set_store
    @store = Store.find(params[:id])
  end
end
