class Api::V1::AdvertisementsController < Api::V1::ApiController
  before_action :set_advertisement, only: [:show, :update, :destroy, :click]

  # GET /advertisements
  def index
    @advertisements = Advertisement.all

    render json: @advertisements
  end

  # GET /advertisements/1
  def show
    render json: @advertisement
  end

  def click
    @advertisement.total_clicks += 1

    if @advertisement.save!
      render json: @advertisement
    else
      render json: @advertisement.errors, status: :unprocessable_entity
    end
  end

  # POST /advertisements
  def create
    @advertisement = Advertisement.new(advertisement_params)

    if @advertisement.save
      render json: @advertisement, status: :created, location: @api_v1_advertisement
    else
      render json: @advertisement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /advertisements/1
  def update
    if @advertisement.update(advertisement_params)
      render json: @advertisement
    else
      render json: @advertisement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /advertisements/1
  def destroy
    @advertisement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def advertisement_params
      params.require(:advertisement).permit(:title,
                                            :restaurant_id,
                                            :vendor_id,
                                            :image,
                                            :size,
                                            :start_date,
                                            :end_date,
                                            :total_clicks)
    end
end
