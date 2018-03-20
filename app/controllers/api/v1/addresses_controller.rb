class Api::V1::AddressesController < Api::V1::ApiController
  before_action :set_address, only: [:show, :update, :destroy]

  # api :GET, '/addresses', "List all addresses"
  def index
    @addresses = Address.all

    render json: @addresses
  end

  # api :GET, '/addresses/:id'
  # param :id, :number
  def show
    render json: @address
  end

  # api :POST, '/addresses'
  # param :address, Hash, :desc => "Create address" do
  #   param :address_type, ["apartment", "house", "office"], :desc => "Address type"
  #   param :building, String, :desc => "Building number"
  #   param :number, String, :desc => "Door number"
  #   param :street, String, :desc => "Street name"
  #   param :floor, String, :desc => "Floor"
  #   param :area_id, :number, :desc => "Area :id"
  # end
  def create
    @address = Address.new(address_params)

    if @address.save
      render json: @address, status: :created, location: @api_v1_address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      render json: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
  end

  def index_profile
    @addresses = Address.where(profile_id: params[:id])
    render json: @addresses
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def address_params
      params.require(:address).permit(:address_type, :building, :number, :street, :floor, :area_id, :profile_id, :latitude, :longitude)
    end
end
