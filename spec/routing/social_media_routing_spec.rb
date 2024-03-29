require "rails_helper"

RSpec.describe SocialMediaController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/social_media").to route_to("social_media#index")
    end


    it "routes to #show" do
      expect(:get => "/social_media/1").to route_to("social_media#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/social_media").to route_to("social_media#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/social_media/1").to route_to("social_media#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/social_media/1").to route_to("social_media#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/social_media/1").to route_to("social_media#destroy", :id => "1")
    end

  end
end
