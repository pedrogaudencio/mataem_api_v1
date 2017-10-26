require 'rails_helper'

RSpec.describe "SocialMedia", type: :request do
  describe "GET /social_media" do
    it "works! (now write some real specs)" do
      get social_media_path
      expect(response).to have_http_status(200)
    end
  end
end
