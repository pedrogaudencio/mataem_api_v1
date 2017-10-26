class CreateVendorCuisines < ActiveRecord::Migration[5.1]
  def change
    create_table :vendor_cuisines do |t|
      t.references :menu_item_cuisine, foreign_key: true
      t.references :vendor, foreign_key: true

      t.timestamps
    end
  end
end
