class CreateItemChoiceVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :item_choice_variants do |t|
      t.references :item_choice, foreign_key: true
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
