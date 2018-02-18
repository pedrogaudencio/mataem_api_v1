class Api::V1::CouponsController < Api::V1::ApiController
  before_action :set_coupon, only: [:show, :update, :destroy]

  # GET /coupons
  def index
    @coupons = Coupon.all

    render json: @coupons
  end

  # GET /coupons/1
  def show
    render json: @coupon
  end

  def get_by_code
    @coupon = Coupon.where(code: params[:code]).first

    render json: @coupon
  end

  # POST /coupons
  def create
    @coupon = Coupon.new(coupon_params)

    if @coupon.save
      if params.key?(:order_id)
        @coupon.update(order: Order.find(params[:order_id]))
      end
      render json: @coupon, status: :created, location: @api_v1_coupon
    else
      render json: @coupon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coupons/1
  def update
    if @coupon.update(coupon_params)
      if params.key?(:order_id)
        @coupon.update(order: Order.find(params[:order_id]))
      end
      render json: @coupon
    else
      render json: @coupon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coupons/1
  def destroy
    @coupon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coupon_params
      params.require(:coupon).permit(:code,
                                     :value,
                                     :expiry_date,
                                     :order_id,
                                     :restaurant_id,
                                     :discount_type,
                                     :maximum_redeem_amount,
                                     :min_order_value,
                                     :app_type,
                                     :user_type)
    end
end
