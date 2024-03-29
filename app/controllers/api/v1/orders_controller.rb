class Api::V1::OrdersController < Api::V1::ApiController
  before_action :set_order, only: [:show, :update, :destroy]

  # api :GET, '/orders', "List all orders"
  def index_admin
    @orders = Order.all

    render json: @orders
  end

  def index_profile
    @orders = Order.where(profile_id: params[:id])

    render json: @orders    
  end

  # api :GET, '/orders', "List all orders"
  def index
    # if @api_v1_current_user.admin?
    #   @orders = Order.all
    # else
    #   @orders = Order.where(vendor_id: order_params[:vendor_id])
    # end

    @orders = Order.where(vendor_id: params[:vendor_id])

    render json: @orders
  end

  # api :GET, '/orders/:id', "Show user profile"
  # param :id, :number
  def show
    render json: @order
  end

  def filter_status
    if params.key?(:status) and [:pending, :accepted, :rejected].include?(params[:status])
      @orders = Order.try(params[:status])
    end
    if @orders
      render json: @orders, location: @api_v1_orders
    else
      render json: nil, status: :not_found
    end
  end

  def filter_progress
    # TODO: change array options from model import variable
    if params.key?(:progress_status) and [:pending_decision,
                                          :accepted_order,
                                          :out_for_delivery,
                                          :delivered,
                                          :closed].include?(params[:progress_status])
      @orders = Order.try(params[:progress_status])
    end
    if @orders
      render json: @orders, location: @api_v1_orders
    else
      render json: nil, status: :not_found
    end
  end

  def filter_delivery_type
    # TODO: change array options from model import variable
    if params.key?(:delivery_type) and [:delivery, :pickup].include?(params[:delivery_type])
      @orders = Order.try(params[:delivery_type])
    end
    if @orders
      render json: @orders, location: @api_v1_orders
    else
      render json: nil, status: :not_found
    end
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    if not @order.profile
      @order.profile = Profile.find(order_params[:profile_id]) or @api_v1_current_user.profile
    end
    if not @order.mobile_number
      @order.mobile_number = @order.profile.mobile_number
    end
    if not @order.delivery_address
      @order.delivery_address = @order.profile.address or @api_v1_current_user.profile.address
    end

    if not @order.delivery_datetime
      @order.delivery_datetime = Time.now
    end

    if @order.save
      params[:order_items].each do |order_item|
        OrderItem.create(
          order: @order,
          quantity: order_item[:quantity],
          menu_item_id: order_item[:menu_item_id]) #,
          # item_choice_variants: ItemChoiceVariant.where(id: order_item[:item_choice_variants]))
      end
      if params[:coupon_id]
        @order.update(coupon: Coupon.find(params[:coupon_id]))
        @order.apply_coupon
      end
      render json: @order, status: :created, location: @api_v1_order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:profile_id,
                                    :mobile_number,
                                    :area_id,
                                    :vendor_id,
                                    :status,
                                    :delivery_type,
                                    :description,
                                    :delivery_datetime,
                                    :finishing_time,
                                    :delivery_charges,
                                    :service_fee,
                                    :order_source,
                                    :progress_status,
                                    :delivery_address,
                                    :payment_type,
                                    order_items_attributes: [
                                      :quantity,
                                      :menu_item_id,
                                      item_choice_variants_attributes: [
                                        :item_choice_id,
                                      ]
                                    ])
    end
end
