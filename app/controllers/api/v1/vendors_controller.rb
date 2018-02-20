class Api::V1::VendorsController < Api::V1::ApiController
  before_action :set_vendor, only: [:show, :update, :destroy]

  # GET /vendors
  def index
    @vendors = Vendor.all

    render json: @vendors
  end

  # GET /vendors/1
  def show
    render json: @vendor
  end

  def get_cuisine
    if params.key?(:cuisine) and not MenuItemCuisine.where(name: params[:cuisine]).first.nil?
      @vendors = Vendor.with_cuisines(params[:cuisine])
    end
    if @vendors
      render json: @vendors, location: @api_v1_vendors
    else
      render json: nil, status: :not_found
    end
  end

  def get_category
    if params.key?(:category) and not MenuItemCategory.where(name: params[:category]).first.nil?
      @vendors = Vendor.with_categories(params[:category])
    end
    if @vendors
      render json: @vendors, location: @api_v1_vendors
    else
      render json: nil, status: :not_found
    end
  end

  def just_opened
    @vendors = Vendor.just_opened
    if @vendors
      render json: @vendors, location: @api_v1_vendors
    else
      render json: nil, status: :not_found
    end
  end

  def free_delivery
    @vendors = Vendor.free_delivery
    if @vendors
      render json: @vendors, location: @api_v1_vendors
    else
      render json: nil, status: :not_found
    end
  end

  def delivers_in
    if params.key?(:area) and not Area.where(name: params[:area]).first.nil?
      @vendors = Vendor.delivers_in(params[:area])
    end
    if @vendors
      render json: @vendors, location: @api_v1_vendors
    else
      render json: nil, status: :not_found
    end
  end

  # POST /vendors
  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      @vendor.update(cuisines: MenuItemCuisine.where(id: params[:cuisine_ids]),
                     categories: MenuItemCategory.where(id: params[:category_ids]))
      if params.key?(:delivery_area_ids)
        params[:delivery_area_ids].each do |area_id|
          VendorDeliveryArea.create(vendor_id: @vendor.id, area_id: area_id)
        end
      end
      render json: @vendor, status: :created, location: @api_v1_vendor
    else
      render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vendors/1
  def update
    if @vendor.update(vendor_params)
      render json: @vendor
    else
      render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  def update_delivery_areas
    @vendor = Vendor.find(params[:vendor_id])

    if params.key?(:delivery_area_ids)
      VendorDeliveryArea.where(vendor_id: params[:vendor_id]).destroy_all
      params[:delivery_area_ids].each do |area_id|
        VendorDeliveryArea.create(vendor_id: params[:vendor_id], area_id: area_id)
      end
      render json: @vendor
    else
      render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vendors/1
  def destroy
    @vendor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vendor_params
      params.require(:vendor).permit(:name,
                                     :address_id,
                                     :restaurant_id,
                                     :preorder,
                                     :pickup,
                                     :delivery_fee,
                                     :delivery_time,
                                     :status,
                                     :busy,
                                     :cuisine_ids,
                                     :category_ids,
                                     :delivery_area_ids)
    end
end
