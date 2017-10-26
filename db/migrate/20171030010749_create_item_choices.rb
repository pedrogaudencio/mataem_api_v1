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
  end
end
