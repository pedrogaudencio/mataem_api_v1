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

    reversible do |dir|
      dir.up do
        MenuItem.create_translation_table!(name: :string,
                                           description: :string,
                                           ingredients: :string)
      end

      dir.down do
        MenuItem.drop_translation_table!
      end
    end
  end
end
