class Api::V1::RestaurantsController < Api::V1::ApiController
  before_action :set_restaurant, only: [:show, :update, :destroy]

  # GET /restaurants
  def index
    @restaurants = Restaurant.all

    render json: @restaurants
  end

  # GET /restaurants/1
  def show
    render json: @restaurant
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if params.key?(:weekdays)
      @restaurant.weekdays = params[:weekdays]
    end

    if @restaurant.save
      render json: @restaurant, status: :created, location: @api_v1_restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurants/1
  def update
    if @restaurant.update(restaurant_params)
      render json: @restaurant
    else
      render json: @restaurant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def restaurant_params
      params.require(:restaurant).permit(:name,
                                         :status,
                                         :featured,
                                         :sort_order,
                                         :logo,
                                         :opening_hours,
                                         :closing_hours,
                                         :weekdays,
                                         social_media_attributes: [:facebook_url,
                                                                   :twitter_url,
                                                                   :google_plus_url,
                                                                   :linkedin_url,
                                                                   :facebook_app_id,
                                                                   :facebook_secret_key])
    end
end
