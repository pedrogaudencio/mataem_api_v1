require "rails_helper"

RSpec.describe OrderAssignmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/order_assignments").to route_to("order_assignments#index")
    end


    it "routes to #show" do
      expect(:get => "/order_assignments/1").to route_to("order_assignments#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/order_assignments").to route_to("order_assignments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/order_assignments/1").to route_to("order_assignments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/order_assignments/1").to route_to("order_assignments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/order_assignments/1").to route_to("order_assignments#destroy", :id => "1")
    end

  end
end
