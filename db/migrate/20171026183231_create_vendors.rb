class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.references :address, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.boolean :preorder
      t.boolean :pickup
      t.float :delivery_fee, default: 0
      t.integer :delivery_time
      t.integer :status, default: 0
      t.references :cuisines, foreign_key: { to_table: :menu_item_cuisines }, index: true
      t.references :categories, foreign_key: { to_table: :menu_item_categories }, index: true

      t.timestamps
    end
  end
end
