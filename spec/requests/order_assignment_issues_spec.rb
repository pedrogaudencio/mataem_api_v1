require 'rails_helper'

RSpec.describe "OrderAssignmentIssues", type: :request do
  describe "GET /order_assignment_issues" do
    it "works! (now write some real specs)" do
      get order_assignment_issues_path
      expect(response).to have_http_status(200)
    end
  end
end
