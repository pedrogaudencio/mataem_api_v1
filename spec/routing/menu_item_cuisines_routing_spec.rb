require "rails_helper"

RSpec.describe MenuItemCuisinesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/menu_item_cuisines").to route_to("menu_item_cuisines#index")
    end


    it "routes to #show" do
      expect(:get => "/menu_item_cuisines/1").to route_to("menu_item_cuisines#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/menu_item_cuisines").to route_to("menu_item_cuisines#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/menu_item_cuisines/1").to route_to("menu_item_cuisines#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/menu_item_cuisines/1").to route_to("menu_item_cuisines#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/menu_item_cuisines/1").to route_to("menu_item_cuisines#destroy", :id => "1")
    end

  end
end
