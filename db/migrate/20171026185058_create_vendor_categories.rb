class CreateVendorCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_categories do |t|
      t.references :menu_item_category, foreign_key: true
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
