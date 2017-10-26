class Api::V1::MenuItemCategoriesController < Api::V1::ApiController
  before_action :set_menu_item_category, only: [:show, :update, :destroy]

  # GET /menu_item_categories
  def index
    @menu_item_categories = MenuItemCategory.all

    render json: @menu_item_categories
  end

  # GET /menu_item_categories/1
  def show
    render json: @menu_item_category
  end

  # POST /menu_item_categories
  def create
    @menu_item_category = MenuItemCategory.new(menu_item_category_params)

    if @menu_item_category.save
      render json: @menu_item_category, status: :created, location: @api_v1_vendor_menu_item_menu_item_category
    else
      render json: @menu_item_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /menu_item_categories/1
  def update
    if @menu_item_category.update(menu_item_category_params)
      render json: @menu_item_category
    else
      render json: @menu_item_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menu_item_categories/1
  def destroy
    @menu_item_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item_category
      @menu_item_category = MenuItemCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_item_category_params
      params.require(:menu_item_category).permit(:name,
                                                 :status,
                                                 :sort_order)
    end
end
