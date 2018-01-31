class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :order_packaging_avg
      t.float :value_for_money_avg
      t.float :delivery_time_avg
      t.float :food_quality_avg
      t.integer :status, default: 0
      t.boolean :featured, default: false
      t.integer :sort_order

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Restaurant.create_translation_table!(name: :string)
      end

      dir.down do
        Restaurant.drop_translation_table!
      end
    end
  end
end
