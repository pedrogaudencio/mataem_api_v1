require "rails_helper"

RSpec.describe ItemChoiceVariantsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/item_choice_variants").to route_to("item_choice_variants#index")
    end


    it "routes to #show" do
      expect(:get => "/item_choice_variants/1").to route_to("item_choice_variants#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/item_choice_variants").to route_to("item_choice_variants#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/item_choice_variants/1").to route_to("item_choice_variants#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/item_choice_variants/1").to route_to("item_choice_variants#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_choice_variants/1").to route_to("item_choice_variants#destroy", :id => "1")
    end

  end
end
