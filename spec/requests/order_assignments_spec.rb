require 'rails_helper'

RSpec.describe "OrderAssignments", type: :request do
  describe "GET /order_assignments" do
    it "works! (now write some real specs)" do
      get order_assignments_path
      expect(response).to have_http_status(200)
    end
  end
end
