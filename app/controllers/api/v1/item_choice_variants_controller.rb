class Api::V1::ItemChoiceVariantsController < Api::V1::ApiController
  before_action :set_item_choice_variant, only: [:show, :update, :destroy]

  # GET /item_choice_variants
  def index
    if params.key?(:item_choice_id)
      @item_choice_variants = ItemChoiceVariant.where(
        item_choice_id: params[:item_choice_id])
    else
      @item_choice_variants = ItemChoiceVariant.all
    end

    render json: @item_choice_variants
  end

  # GET /item_choice_variants/1
  def show
    render json: @item_choice_variant
  end

  # POST /item_choice_variants
  def create
    @item_choice_variant = ItemChoiceVariant.new(item_choice_variant_params)

    if @item_choice_variant.save
      render json: @item_choice_variant, status: :created, location: @api_v1_vendor_menu_item_item_choice_item_choice_variant
    else
      render json: @item_choice_variant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_choice_variants/1
  def update
    if @item_choice_variant.update(item_choice_variant_params)
      render json: @item_choice_variant
    else
      render json: @item_choice_variant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_choice_variants/1
  def destroy
    @item_choice_variant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_choice_variant
      @item_choice_variant = ItemChoiceVariant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_choice_variant_params
      params.require(:item_choice_variant).permit(:item_choice_id, :name, :price)
    end
end
