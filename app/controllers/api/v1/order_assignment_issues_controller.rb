class Api::V1::OrderAssignmentIssuesController < Api::V1::ApiController
  before_action :set_order_assignment_issue, only: [:show, :update, :destroy]

  # GET /order_assignment_issues
  def index
    @order_assignment_issues = OrderAssignmentIssue.where(
      order: params[:order_id])

    render json: @order_assignment_issues
  end

  # GET /order_assignment_issues/1
  def show
    render json: @order_assignment_issue
  end

  # POST /order_assignment_issues
  def create
    @order_assignment_issue = OrderAssignmentIssue.new(order_assignment_issue_params)

    if @order_assignment_issue.save
      render json: @order_assignment_issue, status: :created, location: @api_v1_order_assignment_issue
    else
      render json: @order_assignment_issue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_assignment_issues/1
  def update
    if @order_assignment_issue.update(order_assignment_issue_params)
      render json: @order_assignment_issue
    else
      render json: @order_assignment_issue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_assignment_issues/1
  def destroy
    @order_assignment_issue.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_assignment_issue
      @order_assignment_issue = OrderAssignmentIssue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_assignment_issue_params
      params.require(:order_assignment_issue).permit(:order_id, :comment)
    end
end
