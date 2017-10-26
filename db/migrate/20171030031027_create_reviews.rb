class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :vendor, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :status, default: 0
      t.float :rating
      t.string :comment
      t.integer :order_packaging
      t.integer :value_for_money
      t.integer :delivery_time
      t.integer :food_quality

      t.timestamps
    end
  end
end
