class CreateItemChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :item_choices do |t|
      t.references :menu_item, foreign_key: true
      t.string :name
      t.float :price
      t.integer :status, default: 0
      t.datetime :limit_date_from
      t.datetime :limit_date_until
      t.integer :max_variants

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        ItemChoice.create_translation_table!(name: :string)
      end

      dir.down do
        ItemChoice.drop_translation_table!
      end
    end
  end
end
