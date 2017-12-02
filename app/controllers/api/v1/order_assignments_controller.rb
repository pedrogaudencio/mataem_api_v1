class Api::V1::OrderAssignmentsController < Api::V1::ApiController
  before_action :set_order_assignment, only: [:show, :update, :destroy,
                                              :accept_assignment]

  # GET /order_assignments
  def index
    @order_assignments = OrderAssignment.all

    render json: @order_assignments
  end

  # GET /order_assignments/1
  def show
    render json: @order_assignment
  end

  def list_pending
    @order_assignments = OrderAssignment.pending

    render json: @order_assignments
  end

  def accept_assignment
    if @order_assignment.pending? and @order_assignment.update(assignee: user,
                                                               status: 1)
      render json: @order_assignment
    else
      render json: @order_assignment.errors, status: :unprocessable_entity
    end
  end

  # POST /order_assignments
  def create
    @order_assignment = OrderAssignment.new(order_assignment_params)

    if @order_assignment.save
      render json: @order_assignment, status: :created, location: @api_v1_vendor_order_order_assignment
    else
      render json: @order_assignment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_assignments/1
  def update
    if @order_assignment.update(order_assignment_params)
      render json: @order_assignment
    else
      render json: @order_assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_assignments/1
  def destroy
    @order_assignment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_assignment
      @order_assignment = OrderAssignment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_assignment_params
      params.require(:order_assignment).permit(:assignee_id, :status)
    end
end
