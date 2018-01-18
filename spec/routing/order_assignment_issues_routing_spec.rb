require "rails_helper"

RSpec.describe OrderAssignmentIssuesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/order_assignment_issues").to route_to("order_assignment_issues#index")
    end


    it "routes to #show" do
      expect(:get => "/order_assignment_issues/1").to route_to("order_assignment_issues#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/order_assignment_issues").to route_to("order_assignment_issues#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/order_assignment_issues/1").to route_to("order_assignment_issues#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/order_assignment_issues/1").to route_to("order_assignment_issues#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/order_assignment_issues/1").to route_to("order_assignment_issues#destroy", :id => "1")
    end

  end
end
