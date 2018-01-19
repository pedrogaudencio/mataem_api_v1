class Api::V1::ItemChoicesController < Api::V1::ApiController
  before_action :set_item_choice, only: [:show, :update, :destroy]

  # GET /item_choices
  def index
    if params.key?(:menu_item_id)
      @item_choices = ItemChoice.where(
        menu_item_id: params[:menu_item_id])
    else
      @item_choices = ItemChoice.all
    end

    render json: @item_choices
  end

  # GET /item_choices/1
  def show
    render json: @item_choice
  end

  # POST /item_choices
  def create
    @item_choice = ItemChoice.new(item_choice_params)

    if @item_choice.save
      render json: @item_choice, status: :created, location: @api_v1_vendor_menu_item_item_choice
    else
      render json: @item_choice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_choices/1
  def update
    if @item_choice.update(item_choice_params)
      render json: @item_choice
    else
      render json: @item_choice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_choices/1
  def destroy
    @item_choice.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_choice
      @item_choice = ItemChoice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_choice_params
      params.require(:item_choice).permit(:menu_item_id,
                                          :name,
                                          :price,
                                          :status,
                                          :limit_date_from,
                                          :limit_date_until,
                                          :max_variants)
    end
end
