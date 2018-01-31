class CreateMenuItemCuisines < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_item_cuisines do |t|
      t.string :name
      t.integer :status, default: 0
      t.integer :sort_order

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        MenuItemCuisine.create_translation_table!(name: :string)
      end

      dir.down do
        MenuItemCuisine.drop_translation_table!
      end
    end
  end
end
