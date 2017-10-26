require "rails_helper"

RSpec.describe EnquiriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/enquiries").to route_to("enquiries#index")
    end


    it "routes to #show" do
      expect(:get => "/enquiries/1").to route_to("enquiries#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/enquiries").to route_to("enquiries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/enquiries/1").to route_to("enquiries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/enquiries/1").to route_to("enquiries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/enquiries/1").to route_to("enquiries#destroy", :id => "1")
    end

  end
end
