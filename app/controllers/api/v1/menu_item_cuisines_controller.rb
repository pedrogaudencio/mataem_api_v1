class Api::V1::MenuItemCuisinesController < Api::V1::ApiController
  before_action :set_menu_item_cuisine, only: [:show, :update, :destroy]

  # GET /menu_item_cuisines
  def index
    @menu_item_cuisines = MenuItemCuisine.all

    render json: @menu_item_cuisines
  end

  # GET /menu_item_cuisines/1
  def show
    render json: @menu_item_cuisine
  end

  # POST /menu_item_cuisines
  def create
    @menu_item_cuisine = MenuItemCuisine.new(menu_item_cuisine_params)

    if @menu_item_cuisine.save
      render json: @menu_item_cuisine, status: :created, location: @api_v1_vendor_menu_item_menu_item_cuisine
    else
      render json: @menu_item_cuisine.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /menu_item_cuisines/1
  def update
    if @menu_item_cuisine.update(menu_item_cuisine_params)
      render json: @menu_item_cuisine
    else
      render json: @menu_item_cuisine.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menu_item_cuisines/1
  def destroy
    @menu_item_cuisine.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item_cuisine
      @menu_item_cuisine = MenuItemCuisine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_item_cuisine_params
      params.require(:menu_item_cuisine).permit(:name,
                                                :status,
                                                :sort_order)
    end
end
