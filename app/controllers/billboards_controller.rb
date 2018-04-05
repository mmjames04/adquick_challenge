class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :update, :destroy]

  # GET /billboards
  def index
    @billboards = Billboard.all

    render json: @billboards
  end

  # GET /billboards/1
  def show
    render json: @billboard
  end

  # POST /billboards
  def create
    @billboard = Billboard.new(billboard_params)

    if @billboard.save
      render json: @billboard, status: :created, location: @billboard
    else
      render json: @billboard.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /billboards/1
  def update
    if @billboard.update(billboard_params)
      render json: @billboard
    else
      render json: @billboard.errors, status: :unprocessable_entity
    end
  end

  # DELETE /billboards/1
  def destroy
    @billboard.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billboard
      @billboard = Billboard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def billboard_params
      params.require(:billboard).permit(:vendor_name, :unit_id, :price, :start_date, :end_date, :latitude, :longitude, :creative_asset)
    end
end
