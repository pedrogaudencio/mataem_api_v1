require 'rails_helper'

RSpec.describe "MenuItemCuisines", type: :request do
  describe "GET /menu_item_cuisines" do
    it "works! (now write some real specs)" do
      get menu_item_cuisines_path
      expect(response).to have_http_status(200)
    end
  end
end
