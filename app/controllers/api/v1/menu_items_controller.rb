class Api::V1::MenuItemsController < Api::V1::ApiController
  before_action :set_menu_item, only: [:show, :update, :destroy]

  # GET /menu_items
  def index
    if params.key?(:vendor_id)
      @menu_items = MenuItem.where(vendor_id: params[:vendor_id])
    else
      @menu_items = MenuItem.all
    end

    render json: @menu_items
  end

  # GET /menu_items/1
  def show
    render json: @menu_item
  end

  # POST /menu_items
  def create
    @menu_item = MenuItem.new(menu_item_params)

    if @menu_item.save
      render json: @menu_item, status: :created, location: @api_v1_vendor_menu_item
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  def by_category
    if params[:vendor_id]
      menu_items = MenuItem.where(vendor: params[:vendor_id]).group_by(&:menu_item_category).map do |cat, menu_items|
          {
            "name": cat.name,
           "id": cat.id,
           "status": cat.status,
           "sort_order": cat.sort_order,
           "items": menu_items.collect{ |item| { item_detail: item, image: item.image.url } }
          }
      end
      render json: menu_items
    else
      render json: nil, status: :not_found
    end
  end

  # PATCH/PUT /menu_items/1
  def update
    if @menu_item.update(menu_item_params)
      render json: @menu_item
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /menu_items/1
  def destroy
    @menu_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = MenuItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def menu_item_params
      params.require(:menu_item).permit(:name,
                                        :description,
                                        :ingredients,
                                        :price,
                                        :vendor_id,
                                        :image,
                                        :menu_item_category_id,
                                        :menu_item_cuisine_id)
    end
end
