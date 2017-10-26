class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :description
      t.string :ingredients
      t.float :price
      t.references :menu_item_category, foreign_key: true
      t.references :menu_item_cuisine, foreign_key: true

      t.timestamps
    end
  end
end
