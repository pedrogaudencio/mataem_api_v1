require "rails_helper"

RSpec.describe MenuItemCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/menu_item_categories").to route_to("menu_item_categories#index")
    end


    it "routes to #show" do
      expect(:get => "/menu_item_categories/1").to route_to("menu_item_categories#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/menu_item_categories").to route_to("menu_item_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/menu_item_categories/1").to route_to("menu_item_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/menu_item_categories/1").to route_to("menu_item_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/menu_item_categories/1").to route_to("menu_item_categories#destroy", :id => "1")
    end

  end
end
