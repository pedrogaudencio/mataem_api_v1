class Api::V1::ProfilesController < Api::V1::ApiController
  before_action :set_profile, only: [:create, :show, :update, :destroy,
    :get_mobile_verification_code, :verify_mobile_number, :change_mobile_number]

  # GET /profiles
  def index
    @profiles = Profile.all

    render json: @profiles
  end

  # GET /profiles/1
  def show
    render json: @profile
  end

  # POST /profiles
  def create
    if profile_params.key?(:address_id)
      @profile.address = Address.find(profile_params[:address_id])
    end

    if @profile.update(profile_params)
      @profile.send_sms_code
      render json: @profile, status: :created, location: @api_v1_profile
      # TODO: send sms
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/1
  def update
    if profile_params.key?(:address_id)
      @profile.address = Address.find(profile_params[:address_id])
    end

    if @profile.update(profile_params)
      if not @profile.mobile_number_verified
        @profile.send_sms_code
      end
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
  end

  def get_mobile_verification_code
    render json: {mobile_verification_code: @profile.mobile_verification_code}, location: @api_v1_profile
  end

  def verify_mobile_number
    if not @profile.mobile_number_verified and @profile.mobile_verification_code == params[:mobile_verification_code]
      @profile.update(mobile_number_verified: true)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def change_mobile_number
    if @profile.update(mobile_number: params[:new_mobile_number],
                       mobile_number_verified: false)
      @profile.generate_mobile_code
      @profile.send_sms_code
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def activate_profile
    if @profile.update(status: 0)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def deactivate_profile
    if @profile.update(status: 1)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def block_profile
    if @profile.update(status: 2)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      if not current_api_v1_user.nil?
        @profile = current_api_v1_user.profile
      elsif params.key?(:user_id)
        @profile = User.find(params[:user_id]).try(:profile)
      else
        @profile = Profile.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      params.require(:profile).permit(:mobile_number,
                                      :mobile_verification_code,
                                      :address_id,
                                      :status,
                                      :loyalty_points,
                                      :user_id,
                                      :first_name,
                                      :last_name)
    end
end
