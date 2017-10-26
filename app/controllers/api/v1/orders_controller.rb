class Api::V1::OrdersController < Api::V1::ApiController
  # include Orderable

  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    # if params
    #   if params[:status] and [:pending, :accepted, :rejected].any? { |s| params[:status] == s }
    #     puts "cona"
    #     @orders = Order.send(params[:status])
    #   elsif params[:progress_status]
    #     @orders = Order.send(params[:progress_status])
    #   elsif params[:delivery_type]
    #     @orders = Order.send(params[:delivery_type])
    #   end
    # else
    #   @orders = Order.all
    # end

    render json: @orders#, each_serializer: OrderSerializer, scope: {
    #   'status': params[:status],
    #   'progress_status': params[:progress_status],
    #   'delivery_type': params[:delivery_type]
    # }
  end

  # GET /orders/1
  def show
    render json: @order
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
