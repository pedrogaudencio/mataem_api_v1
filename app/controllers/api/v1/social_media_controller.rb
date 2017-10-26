class Api::V1::SocialMediaController < Api::V1::ApiController
  before_action :set_social_media, only: [:show, :update, :destroy]

  # GET /social_media
  def index
    @social_media = SocialMedia.all

    render json: @social_media
  end

  # GET /social_media/1
  def show
    render json: @social_media
  end

  # POST /social_media
  def create
    @social_media = SocialMedia.new(social_media_params)

    if @social_media.save
      render json: @social_media, status: :created, location: @api_v1_social_medium
    else
      render json: @social_media.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /social_media/1
  def update
    if @social_media.update(social_media_params)
      render json: @social_media
    else
      render json: @social_media.errors, status: :unprocessable_entity
    end
  end

  # DELETE /social_media/1
  def destroy
    @social_media.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_media
      @social_media = SocialMedia.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def social_media_params
      params.require(:social_medium).permit(:restaurant_id, :facebook_url, :twitter_url, :google_plus_url, :linkedin_url, :facebook_app_id, :facebook_secret_key)
    end
end
