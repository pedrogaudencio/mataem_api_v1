class Api::V1::AreasController < Api::V1::ApiController
  before_action :set_area, only: [:show, :update, :destroy]

  # GET /areas
  def index
    @areas = Area.all

    render json: @areas
  end

  # GET /areas/1
  def show
    render json: @area
  end

  # POST /areas
  def create
    @area = Area.new(area_params)

    if @area.save
      render json: @area, status: :created, location: @api_v1_area
    else
      render json: @area.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /areas/1
  def update
    if @area.update(area_params)
      render json: @area
    else
      render json: @area.errors, status: :unprocessable_entity
    end
  end

  # DELETE /areas/1
  def destroy
    @area.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def area_params
      params.require(:area).permit(:name, :city_id, :latitude, :longitude, :status)
    end
end
