class CreateMenuItemCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_item_categories do |t|
      t.string :name
      t.integer :status, default: 0
      t.integer :sort_order

      t.timestamps
    end
  end
end
