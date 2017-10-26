require 'rails_helper'

RSpec.describe "MenuItemCategories", type: :request do
  describe "GET /menu_item_categories" do
    it "works! (now write some real specs)" do
      get menu_item_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
