class Api::V1::OrdersController < Api::V1::ApiController
  before_action :set_order, only: [:show, :update, :destroy]

  # api :GET, '/orders', "List all orders"
  def index
    @orders = Order.all

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

    if @order.save
      render json: @order, status: :created, location: @order
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
      params.require(:order).permit(:profile, :mobile_number, :area, :vendor, :status, :delivery_type, :finishing_time, :delivery_charges, :service_fee, :order_source, :progress_status, :delivery_address, :total)
    end
end
