require "rails_helper"

RSpec.describe AdvertisementsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/advertisements").to route_to("advertisements#index")
    end


    it "routes to #show" do
      expect(:get => "/advertisements/1").to route_to("advertisements#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/advertisements").to route_to("advertisements#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/advertisements/1").to route_to("advertisements#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/advertisements/1").to route_to("advertisements#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/advertisements/1").to route_to("advertisements#destroy", :id => "1")
    end

  end
end
