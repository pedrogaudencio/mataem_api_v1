class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.integer :quantity
      t.references :menu_item, foreign_key: true
      t.integer 'item_choice_variants', array: true, default: []
      t.float :price

      t.timestamps
    end
  end
end
