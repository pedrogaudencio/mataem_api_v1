require 'rails_helper'

RSpec.describe "ItemChoiceVariants", type: :request do
  describe "GET /item_choice_variants" do
    it "works! (now write some real specs)" do
      get item_choice_variants_path
      expect(response).to have_http_status(200)
    end
  end
end
