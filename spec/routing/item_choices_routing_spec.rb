require "rails_helper"

RSpec.describe ItemChoicesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/item_choices").to route_to("item_choices#index")
    end


    it "routes to #show" do
      expect(:get => "/item_choices/1").to route_to("item_choices#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/item_choices").to route_to("item_choices#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/item_choices/1").to route_to("item_choices#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/item_choices/1").to route_to("item_choices#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_choices/1").to route_to("item_choices#destroy", :id => "1")
    end

  end
end
