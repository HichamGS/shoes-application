class ShoesController < ApplicationController
  before_action :set_shoe, only: %i[show update destroy]
  # get /shoes
  def index
    @shoes = if params[:keyword]
        Shoe.where(name: params[:keyword]).first
      else
        Shoe.all
      end
    json_response(@shoes)
  end

  # get /shoes/:id
  def show
    json_response(@shoe)
  end

  # POST /shoes
  def create
    @shoe = Shoe.create!(shoe_params)
    json_response(@shoe, :created)
  end

  # PUT /shoes/:id
  def update
    @shoe.update(shoe_params)
    head :no_content
  end

  # DELETE /shoes/:id
  def destroy
    @shoe.destroy
    head :no_content
  end

  private

  def shoe_params
    params.permit(:name)
  end

  def set_shoe
    @shoe = Shoe.find(params[:id])
  end
end
