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

  # POST /vendors
  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
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
                                     :cuisines,
                                     :categories,
                                     :delivery_areas)
    end
end
