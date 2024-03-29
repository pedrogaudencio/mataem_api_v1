require "rails_helper"

RSpec.describe CouponsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/coupons").to route_to("coupons#index")
    end


    it "routes to #show" do
      expect(:get => "/coupons/1").to route_to("coupons#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/coupons").to route_to("coupons#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/coupons/1").to route_to("coupons#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/coupons/1").to route_to("coupons#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/coupons/1").to route_to("coupons#destroy", :id => "1")
    end

  end
end
