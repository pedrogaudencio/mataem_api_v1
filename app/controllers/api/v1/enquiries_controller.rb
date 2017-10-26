class Api::V1::EnquiriesController < Api::V1::ApiController
  before_action :set_enquiry, only: [:show, :update, :destroy]

  # GET /enquiries
  def index
    @enquiries = Enquiry.all

    render json: @enquiries
  end

  # GET /enquiries/1
  def show
    render json: @enquiry
  end

  # POST /enquiries
  def create
    @enquiry = Enquiry.new(enquiry_params)

    if @enquiry.save
      render json: @enquiry, status: :created, location: @api_v1_enquiry
    else
      render json: @enquiry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enquiries/1
  def update
    if @enquiry.update(enquiry_params)
      render json: @enquiry
    else
      render json: @enquiry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /enquiries/1
  def destroy
    @enquiry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enquiry
      @enquiry = Enquiry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def enquiry_params
      params.require(:enquiry).permit(:name, :user_id, :email, :mobile_number, :subject)
    end
end
