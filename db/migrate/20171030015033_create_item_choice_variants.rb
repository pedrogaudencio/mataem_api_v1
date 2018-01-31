class CreateItemChoiceVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :item_choice_variants do |t|
      t.references :item_choice, foreign_key: true
      t.string :name
      t.float :price

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        ItemChoiceVariant.create_translation_table!(name: :string)
      end

      dir.down do
        ItemChoiceVariant.drop_translation_table!
      end
    end
  end
end
